-- Threat: !InfrastructureShared
-- Name: 4d89fa17e08a
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 39, "\144\144")
pe.mmap_patch_va(pevars.sigaddr + 61, "\144\144")
return mp.CLEAN
