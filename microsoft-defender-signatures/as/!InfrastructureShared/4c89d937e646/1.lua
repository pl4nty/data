-- Threat: !InfrastructureShared
-- Name: 4c89d937e646
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 12, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
