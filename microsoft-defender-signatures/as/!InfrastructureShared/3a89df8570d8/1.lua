-- Threat: !InfrastructureShared
-- Name: 3a89df8570d8
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 3, "\001\000")
pe.mmap_patch_va(pevars.sigaddr + 65, "\001\000")
return mp.INFECTED
