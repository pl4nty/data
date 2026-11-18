-- Threat: !InfrastructureShared
-- Name: 6595225d091a
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144\144\144\144\144\144\144\144")
return mp.INFECTED
