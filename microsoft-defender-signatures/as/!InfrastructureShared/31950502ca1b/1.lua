-- Threat: !InfrastructureShared
-- Name: 31950502ca1b
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
