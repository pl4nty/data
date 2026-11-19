-- Threat: !InfrastructureShared
-- Name: 3a8916431f50
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 19, "\132")
pe.mmap_patch_va(pevars.sigaddr + 42, "\132")
return mp.INFECTED
