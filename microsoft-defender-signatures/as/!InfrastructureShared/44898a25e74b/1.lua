-- Threat: !InfrastructureShared
-- Name: 44898a25e74b
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 8, "\137\014\144\144\144\144\144\144")
return mp.INFECTED
