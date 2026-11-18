-- Threat: !InfrastructureShared
-- Name: 3989643feb4d
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + string.find(pe.mmap_va(pevars.sigaddr, 128), "A\235", 1, true), "\235\001")
return mp.INFECTED
