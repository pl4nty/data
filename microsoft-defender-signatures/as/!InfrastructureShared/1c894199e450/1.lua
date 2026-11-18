-- Threat: !InfrastructureShared
-- Name: 1c894199e450
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 13, "\199E\232\002-1\001\144\144")
return mp.INFECTED
