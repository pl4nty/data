-- Threat: !InfrastructureShared
-- Name: 3d896e7f4f4b
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 2, "\000\000\000\000")
pe.mmap_patch_va(pevars.sigaddr + 10, "\000\000\000\000")
pe.mmap_patch_va(pevars.sigaddr + 16, "\000\000\000")
return mp.INFECTED
