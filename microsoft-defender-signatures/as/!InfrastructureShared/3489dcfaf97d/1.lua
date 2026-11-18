-- Threat: !InfrastructureShared
-- Name: 3489dcfaf97d
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 15, "\235")
return mp.INFECTED
