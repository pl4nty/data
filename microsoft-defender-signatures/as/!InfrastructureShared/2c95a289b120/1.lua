-- Threat: !InfrastructureShared
-- Name: 2c95a289b120
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 29, "\199E")
pe.mmap_patch_va(pevars.sigaddr + 36, "\144\144")
return mp.INFECTED
