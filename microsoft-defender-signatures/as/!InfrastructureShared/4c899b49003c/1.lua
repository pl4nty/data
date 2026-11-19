-- Threat: !InfrastructureShared
-- Name: 4c899b49003c
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 11, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
