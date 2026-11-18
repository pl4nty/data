-- Threat: !InfrastructureShared
-- Name: 348962eea6c4
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 4, "\235")
return mp.INFECTED
