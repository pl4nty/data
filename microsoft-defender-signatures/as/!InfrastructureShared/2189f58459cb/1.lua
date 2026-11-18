-- Threat: !InfrastructureShared
-- Name: 2189f58459cb
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\235")
return mp.INFECTED
