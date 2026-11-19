-- Threat: !InfrastructureShared
-- Name: 2c890fe39f32
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\002\000\000\000")
pe.mmap_patch_va(pevars.sigaddr + 16, "\000\000\000\000")
return mp.INFECTED
