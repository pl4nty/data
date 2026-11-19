-- Threat: !InfrastructureShared
-- Name: 2495ccb7f759
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 1, "\245")
return mp.INFECTED
