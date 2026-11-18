-- Threat: !InfrastructureShared
-- Name: 1889f6961160
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 9, "\000\000")
return mp.INFECTED
