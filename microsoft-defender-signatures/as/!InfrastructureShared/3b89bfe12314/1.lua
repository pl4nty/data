-- Threat: !InfrastructureShared
-- Name: 3b89bfe12314
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 25, "\132")
pe.mmap_patch_va(pevars.sigaddr + 48, "\132")
return mp.INFECTED
