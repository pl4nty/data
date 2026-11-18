-- Threat: !InfrastructureShared
-- Name: 3a89845ba752
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 3, "\001\000")
pe.mmap_patch_va(pevars.sigaddr + 66, "\001\000")
return mp.INFECTED
