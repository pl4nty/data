-- Threat: !InfrastructureShared
-- Name: 348993d767ea
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 17, "\235")
return mp.INFECTED
