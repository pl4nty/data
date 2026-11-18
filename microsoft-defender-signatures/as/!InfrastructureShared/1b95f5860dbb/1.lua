-- Threat: !InfrastructureShared
-- Name: 1b95f5860dbb
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\001\000\000\000")
return mp.INFECTED
