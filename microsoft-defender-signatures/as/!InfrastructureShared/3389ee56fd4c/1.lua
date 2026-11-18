-- Threat: !InfrastructureShared
-- Name: 3389ee56fd4c
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 75, "\235\002")
return mp.INFECTED
