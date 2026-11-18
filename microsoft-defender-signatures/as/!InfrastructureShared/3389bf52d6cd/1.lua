-- Threat: !InfrastructureShared
-- Name: 3389bf52d6cd
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\000\000\002\000")
return mp.INFECTED
