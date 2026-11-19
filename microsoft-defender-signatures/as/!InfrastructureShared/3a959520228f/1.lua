-- Threat: !InfrastructureShared
-- Name: 3a959520228f
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
