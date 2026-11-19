-- Threat: !InfrastructureShared
-- Name: 2e8962a60777
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 9, "\235")
return mp.INFECTED
