-- Threat: !InfrastructureShared
-- Name: 1c95a3a7c8f6
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 2, "\255")
return mp.INFECTED
