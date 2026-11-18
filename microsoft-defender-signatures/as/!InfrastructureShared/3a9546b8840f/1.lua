-- Threat: !InfrastructureShared
-- Name: 3a9546b8840f
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 14, "\144\144\144\144\144")
return mp.INFECTED
