-- Threat: !InfrastructureShared
-- Name: 2e956cd7fc37
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
