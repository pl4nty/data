-- Threat: !InfrastructureShared
-- Name: 3089a21ac62d
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 3, "\001\000")
pe.mmap_patch_va(pevars.sigaddr + 51, "\001\000")
return mp.INFECTED
