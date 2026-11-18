-- Threat: !InfrastructureShared
-- Name: 1789510b0130
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 7, "\235")
return mp.INFECTED
