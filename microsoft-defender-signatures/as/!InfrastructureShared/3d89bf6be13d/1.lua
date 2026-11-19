-- Threat: !InfrastructureShared
-- Name: 3d89bf6be13d
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\235")
return mp.INFECTED
