-- Threat: !InfrastructureShared
-- Name: 2a89d8eb4d61
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 3, "\235")
pe.mmap_patch_va(pevars.sigaddr + 12, "\235")
return mp.INFECTED
