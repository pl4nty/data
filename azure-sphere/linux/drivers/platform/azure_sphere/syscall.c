#include <linux/types.h>
#include <linux/device.h>
#include <linux/arm-smccc.h>
#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>
#include <uapi/linux/azure-sphere/syscall.h>
#include <azure-sphere/security_monitor.h>
#include <azure-sphere/pluton_remoteapi.h>

#include "security_monitor.h"

#define SM_MINIMUM_CACHE_COHERENCY_BUFFER_SIZE 4

///
/// Structure for tracking coherent memory for SMC calls.
///
/// @size                 - Size (in bytes) of the memory buffer
/// @memory_buffer        - The DMA addressable memory buffer.
/// @coherent_memory_addr - The cache coherent memory address of the buffer.
/// @owns_buffer          - Determines if the coherent APIs owns the buffer.
/// @is_dma_alloc         - Determines if dma_alloc_coherent was used to create the buffer.
/// @is_initialized       - Determines if the structure is initialized.
typedef struct _azure_sphere_syscall_coherent_memory_params {
	size_t size;
	const void* memory_buffer;
	dma_addr_t coherent_memory_addr;
	bool owns_buffer;
	bool is_dma_alloc;
	bool is_initialized;
} azure_sphere_syscall_coherent_memory_params;

///
/// Allocates either a kernel buffer or a dma coherent buffer depending on the requested size. If
/// the requested buffer size is less than a page, this function will use kzmalloc and map the coherent
/// address, otherwise, it will use dma_alloc_coherent since its min size is one page. The output
/// parameter coherency_params can be used with other azure_sphere_sm_coherent_memory_* functions to
/// perform cache coherent transactions across the secure world boundary.
///
/// @size               - The size of the provided buffer (in bytes).
/// @coherency_params   - The output parameter that contains the coherency information for other calls
///                       to azure_sphere_sm_coherent_memory_*.
/// @out_buffer         - An optional out parameter that will point to the allocated buffer.
/// @returns            - Returns 0 if successfull; otherwise, returns a negative value.
static int azure_sphere_syscall_coherent_memory_alloc(
	size_t size, azure_sphere_syscall_coherent_memory_params *coherency_params, void** out_buffer)
{
	void *alloc_buffer = NULL;
	dma_addr_t dma_addr = DMA_MAPPING_ERROR;
	bool use_dma_alloc = size >= PAGE_SIZE;

	if (coherency_params == NULL) {
		return -EINVAL;
	}
	
	if (out_buffer != NULL) {
		*out_buffer = NULL;
	}

	size = ALIGN(size, SM_MINIMUM_CACHE_COHERENCY_BUFFER_SIZE);

	///
	/// Allocate using dma_alloc_coherent if the size of the buffer is bigger
	/// than one page size. dma_alloc_coherent will allocate a minimum size of
	/// one page, so for smaller objects use kzmalloc and use dma_map_single
	/// to get the coherent memory address.
	///
	if (use_dma_alloc) {
		alloc_buffer = dma_alloc_coherent(g_sm_dev, size, &dma_addr,
				       GFP_KERNEL);

		if (dma_mapping_error(g_sm_dev, dma_addr) || alloc_buffer == NULL) {
			dev_err(g_sm_dev, "Failed dma_alloc_coherent");
			return -ENOMEM;
		}
	} else {
		alloc_buffer = kzalloc(size, GFP_KERNEL);

		if (alloc_buffer == NULL) {
			dev_err(g_sm_dev, "Failed to allocate GFP_KERNEL memory");
			return -ENOMEM;
		}
	}

	// update the output parameter values
	coherency_params->is_dma_alloc = use_dma_alloc;
	coherency_params->size = size;
	coherency_params->coherent_memory_addr = dma_addr;
	coherency_params->owns_buffer = true;	
	coherency_params->memory_buffer = alloc_buffer;
	coherency_params->is_initialized = true;

	if (out_buffer != NULL) {
		*out_buffer = alloc_buffer;
	}

	return 0;
}

///
/// For non-DMA allocated buffers, this function will map the cache coherent memory address for
/// the buffer. After this call, the memory buffer must not be modified by NW until
/// azure_sphere_syscall_coherent_memory_unmap is called. For DMA allocated buffers, this is a no-op.
///
/// @coherency_params   - The parameter that contains the coherency information for the an
///                       allocation used in the SMC calls.
/// @returns            - Returns 0 if successfull; otherwise, returns a negative value.
static int azure_sphere_syscall_coherent_memory_map(
	azure_sphere_syscall_coherent_memory_params *coherency_params)
{
	if (coherency_params == NULL || !coherency_params->is_initialized) {
		return -EINVAL;
	}

	///
	/// DMA allocated buffers do not need to be mapped.
	///
	if (!coherency_params->is_dma_alloc) {
		dma_addr_t dma_addr =
			dma_map_single(g_sm_dev, (void**)coherency_params->memory_buffer, coherency_params->size, DMA_FROM_DEVICE);

		if (dma_mapping_error(g_sm_dev, dma_addr)) {
			dev_err(g_sm_dev, "Failed dma_map_single");
			return -ENOMEM;
		}

		dma_sync_single_for_device(g_sm_dev, dma_addr, coherency_params->size, DMA_FROM_DEVICE);
		coherency_params->coherent_memory_addr = dma_addr;
	}

	return 0;
}

///
/// For non-DMA allocated buffers, this function will un-map the cache coherent memory address for
/// the buffer. This is required to be done before the buffer memory is accessed. For DMA allocated
/// buffers, this is a no-op.
///
/// @coherency_params - The parameter that contains the coherency information for the an allocation
///                     used in the SMC calls.
/// @returns          - Returns 0 if successfull; otherwise, returns a negative value.
static void azure_sphere_syscall_coherent_memory_unmap(
	azure_sphere_syscall_coherent_memory_params *coherency_params)
{
	if (coherency_params == NULL || !coherency_params->is_initialized) {
		return;
	}

	if (!coherency_params->is_dma_alloc &&
		coherency_params->coherent_memory_addr != DMA_MAPPING_ERROR) {

 		dma_unmap_single(g_sm_dev, coherency_params->coherent_memory_addr, coherency_params->size, DMA_FROM_DEVICE);
		coherency_params->coherent_memory_addr = DMA_MAPPING_ERROR;
	}
}

///
/// Unmaps and frees (if owned) the allocated buffer used by the coherency_params structure.
///
/// @coherency_params - The parameter that contains the coherency information for the an
///                     allocation used in the SMC calls.
/// @returns          - Returns 0 if successfull; otherwise, returns a negative value.
static void azure_sphere_syscall_coherent_memory_free(
	azure_sphere_syscall_coherent_memory_params *coherency_params)
{
	if (coherency_params == NULL || !coherency_params->is_initialized) {
		return;
	}

	if (coherency_params->is_dma_alloc) {
		if (coherency_params->owns_buffer) {
			dma_free_coherent(g_sm_dev,
							coherency_params->size,
							(void**)coherency_params->memory_buffer,
							coherency_params->coherent_memory_addr);
		}
	} else {
		if (coherency_params->coherent_memory_addr != DMA_MAPPING_ERROR) {
	 		dma_unmap_single(g_sm_dev,
			 				 coherency_params->coherent_memory_addr,
							 coherency_params->size,
							 DMA_FROM_DEVICE);
		}
		if (coherency_params->owns_buffer) {
			kfree(coherency_params->memory_buffer);
			coherency_params->memory_buffer = NULL;
		}
	}

	coherency_params->coherent_memory_addr = DMA_MAPPING_ERROR;
}

u32 GetFlagsForArg(u32 flags, u8 idx)
{
    u32 bits = (flags >> (idx * ArgumentIndexShift)) &
                         ((1 << ArgumentIndexShift) - 1);

    return bits;
}

struct azure_sphere_ipc_syscall_args {
    struct azure_sphere_syscall args;
    u32 err;
    bool processed;
};

int send_security_monitor_syscall(struct azure_sphere_syscall* translated_args) {
	struct arm_smccc_res res = {0};

	arm_smccc_smc(SECURITY_MONITOR_FUNCTION(SECURITY_MONITOR_API_SYNC, translated_args->number), translated_args->args[0], 
		translated_args->args[1], translated_args->args[2], translated_args->args[3], translated_args->args[4], 
		translated_args->args[5], 0, &res);
	return res.a0;
}

int azure_sphere_execute_syscall(struct azure_sphere_syscall *syscall, bool from_user, bool security_monitor)
{
	int result = 0;
	u32 i = 0;
	size_t needed_size = 0;
	azure_sphere_syscall_coherent_memory_params params = {0};
	struct azure_sphere_syscall translated_args = {0};
	uint8_t *params_va = NULL;
	uint8_t *cursor = NULL;

	translated_args.number = syscall->number;


	dev_dbg(g_sm_dev, "Syscall args at %p\n", syscall);

	if (!security_monitor) {
		needed_size += sizeof(struct azure_sphere_ipc_syscall_args);
	}

	// compute size needed to copy
	for (i = 0; i < ARRAY_SIZE(syscall->args); i++) {
		u32 flags = GetFlagsForArg(syscall->flags, i);

		translated_args.args[i] = syscall->args[i];

		if (flags & (Pointer | Reference)) {
			if (i < (ARRAY_SIZE(syscall->args) - 1)) {
				// Valid as we have space for a size still
				u32 size_flags = GetFlagsForArg(syscall->flags, i+1);
				size_t sz = syscall->args[i+1];

				if (size_flags & (Pointer | Reference)) {
					// Two pointers can't be back to back
					result = EINVAL;
					goto exit;
				}

				if (sz > MaxArgsSize || (sz + needed_size) > MaxArgsSize) {
					result = ENOMEM;
					goto exit;
				}

				needed_size += sz;
			} else {
				// Not valid as the last parameter cannot be a pointer / reference
				result = EINVAL;
				goto exit;
			}
		}
	}

	dev_dbg(g_sm_dev, "incoming syscall %lu - %lx %lx %lx %lx %lx %lx\n", syscall->number, syscall->args[0], 
		syscall->args[1], syscall->args[2], syscall->args[3], syscall->args[4],
		syscall->args[5]);

	if (needed_size) {
		dev_dbg(g_sm_dev, "syscall alloc of size %zu\n", needed_size);

		// alloc memory if needed
		result = azure_sphere_syscall_coherent_memory_alloc(needed_size, &params, (void**)&params_va);
		if (result != 0) {
			goto exit;
		}

		cursor = params_va;

		if (!security_monitor) {
			memset(cursor, 0, sizeof(struct azure_sphere_ipc_syscall_args));
			cursor += sizeof(struct azure_sphere_ipc_syscall_args);
		}

		dev_dbg(g_sm_dev, "syscall params va %lx\n", (uintptr_t)params_va);

		// copy inputs, clear outputs
		for (i = 0; i < (ARRAY_SIZE(syscall->args) - 1); i++) {
			u32 flags = GetFlagsForArg(syscall->flags, i);

			if ((flags & (Pointer | Reference))) {
				if (syscall->args[i] != 0) {
					if ((flags & Input)) {
						if (from_user) {
							result = copy_from_user(cursor, (void *)syscall->args[i], syscall->args[i+1]);
							if (unlikely(result)) {
								goto exit;
							}
						} else {
							memcpy(cursor, (const void*)syscall->args[i], syscall->args[i+1]);
						}
					} else if ((flags & Output)) {
						dev_dbg(g_sm_dev, "output params va %lx length %lu\n", (uintptr_t)cursor, syscall->args[i+1]);

						memset(cursor, 0, syscall->args[i+1]);
					}

					translated_args.args[i] = (cursor - params_va);
				}

				cursor += syscall->args[i+1];
			}
		}

		// map it
		result = azure_sphere_syscall_coherent_memory_map(&params);
		if (result != 0) {
			goto exit;
		}

		dev_dbg(g_sm_dev, "final HW mem address %llx\n", (u64)params.coherent_memory_addr);

		// We must do this after mapping to ensure we have the final mapped address
		for (i = 0; i < (ARRAY_SIZE(syscall->args) - 1); i++) {
			u32 flags = GetFlagsForArg(syscall->flags, i);

			if ((flags & (Pointer | Reference)) && syscall->args[i] != 0) {
				translated_args.args[i] += params.coherent_memory_addr;
			}
		}

		if (!security_monitor) {
			memcpy(params_va, &translated_args, sizeof(translated_args));

			// Remap to flush the changes
			result = azure_sphere_syscall_coherent_memory_map(&params);
			if (result != 0) {
				goto exit;
			}
		}
	}

	dev_dbg(g_sm_dev, "calling syscall %lu - %lx %lx %lx %lx %lx %lx\n", translated_args.number, translated_args.args[0], 
		translated_args.args[1], translated_args.args[2], translated_args.args[3], translated_args.args[4],
		translated_args.args[5]);

	// invoke the call
	if (security_monitor) {
		result = send_security_monitor_syscall(&translated_args);
	} else {
		result = pluton_remote_api_send((uintptr_t)params.coherent_memory_addr);
		if (result < 0) {
			dev_info(g_sm_dev, "incoming syscall %lu - %lx %lx %lx %lx %lx %lx\n", syscall->number, syscall->args[0], 
			syscall->args[1], syscall->args[2], syscall->args[3], syscall->args[4],
			syscall->args[5]);
		}
	}

	dev_dbg(g_sm_dev, "syscall result %lu\n", (long unsigned)result);

	// Copy outputs
	if (needed_size) {
		cursor = params_va;

		// Unmap
		azure_sphere_syscall_coherent_memory_unmap(&params);

		if (!security_monitor) {
			struct azure_sphere_ipc_syscall_args *final_args = (struct azure_sphere_ipc_syscall_args *)cursor;

			if (!result) {
				result = final_args->err;
			}

			cursor += sizeof(struct azure_sphere_ipc_syscall_args);
		}

		// Copy data
		for (i = 0; i < (ARRAY_SIZE(syscall->args) - 1); i++) {
			u32 flags = GetFlagsForArg(syscall->flags, i);

			if (flags & (Pointer | Reference)) {
				if ((flags & Output) && syscall->args[i]) {
					if (from_user) {
						if (unlikely(copy_to_user((void*)syscall->args[i], cursor, syscall->args[i+1]))) {
							result = -EFAULT;
							goto exit;
						}
					} else {
						memcpy((void*)syscall->args[i], cursor, syscall->args[i+1]);
					}
				}

				cursor += syscall->args[i+1];
			}
		}
	}
exit:
	// free coherent memory
	azure_sphere_syscall_coherent_memory_free(&params);

	return result;
}

int azure_sphere_pluton_execute_syscall(struct azure_sphere_syscall *syscall, bool from_user)
{
	return azure_sphere_execute_syscall(syscall, from_user, false);
}

int azure_sphere_sm_execute_syscall(struct azure_sphere_syscall *syscall, bool from_user)
{
	return azure_sphere_execute_syscall(syscall, from_user, true);
}
