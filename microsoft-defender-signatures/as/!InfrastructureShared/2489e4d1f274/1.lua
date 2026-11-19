-- Threat: !InfrastructureShared
-- Name: 2489e4d1f274
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 10, "\000\000\000\000")
return mp.INFECTED
