-- Threat: !InfrastructureShared
-- Name: 3d890f12388c
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 33, "\015\132")
return mp.INFECTED
