-- Threat: !InfrastructureShared
-- Name: 3689de0a6ba9
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 26, "\235")
return mp.INFECTED
