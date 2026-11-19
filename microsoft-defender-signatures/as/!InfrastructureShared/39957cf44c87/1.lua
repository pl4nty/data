-- Threat: !InfrastructureShared
-- Name: 39957cf44c87
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
