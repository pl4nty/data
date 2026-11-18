-- Threat: !InfrastructureShared
-- Name: 1889a812adcf
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\235")
return mp.INFECTED
