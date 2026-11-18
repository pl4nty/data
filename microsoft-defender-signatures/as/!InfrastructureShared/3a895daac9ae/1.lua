-- Threat: !InfrastructureShared
-- Name: 3a895daac9ae
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 33, "\144\144\144")
pe.mmap_patch_va(pevars.sigaddr + 38, "\144\144")
return mp.INFECTED
