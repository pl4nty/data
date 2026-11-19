-- Threat: !InfrastructureShared
-- Name: 3a89e0cc0d79
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 2, "\144\144")
return mp.INFECTED
