-- Threat: !InfrastructureShared
-- Name: 248917bccb4f
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144")
return mp.INFECTED
