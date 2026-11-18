-- Threat: !InfrastructureShared
-- Name: 368947962912
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 20, "\235\005")
return mp.INFECTED
