-- Threat: !InfrastructureShared
-- Name: 5589d4855230
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 68, "\144\144\144\144\144\144\144")
return mp.INFECTED
