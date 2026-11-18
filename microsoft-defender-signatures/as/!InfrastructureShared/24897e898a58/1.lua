-- Threat: !InfrastructureShared
-- Name: 24897e898a58
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 11, "\235")
pe.mmap_patch_va(pevars.sigaddr + 16, "\002")
return mp.INFECTED
