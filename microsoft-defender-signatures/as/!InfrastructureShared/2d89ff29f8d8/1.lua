-- Threat: !InfrastructureShared
-- Name: 2d89ff29f8d8
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 17, "\000\000\000\000")
return mp.INFECTED
