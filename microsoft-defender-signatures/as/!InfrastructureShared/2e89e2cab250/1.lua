-- Threat: !InfrastructureShared
-- Name: 2e89e2cab250
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 18, "\144\144")
pe.mmap_patch_va(pevars.sigaddr + 35, "\144\144")
return mp.CLEAN
