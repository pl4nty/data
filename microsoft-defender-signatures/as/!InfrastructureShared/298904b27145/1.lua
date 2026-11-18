-- Threat: !InfrastructureShared
-- Name: 298904b27145
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 1, "\016\000\000")
return mp.INFECTED
