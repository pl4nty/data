-- Threat: !InfrastructureShared
-- Name: 1c8900f1b9a5
-- Type: 21

pe.mmap_patch_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 4, 4), 1), "<")
return mp.INFECTED
