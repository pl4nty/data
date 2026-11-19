-- Threat: !InfrastructureShared
-- Name: 6e95c8bcbdd6
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144")
return mp.INFECTED
