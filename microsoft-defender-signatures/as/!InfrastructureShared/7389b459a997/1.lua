-- Threat: !InfrastructureShared
-- Name: 7389b459a997
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 10, "\000\001\000\000")
pe.mmap_patch_va(pevars.sigaddr + 58, "\144\144")
return mp.INFECTED
