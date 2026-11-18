-- Threat: !InfrastructureShared
-- Name: 4789de07ede5
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 39, "\144\144")
pe.mmap_patch_va(pevars.sigaddr + 58, "\144\144")
return mp.CLEAN
