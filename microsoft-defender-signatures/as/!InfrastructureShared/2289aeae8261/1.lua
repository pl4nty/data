-- Threat: !InfrastructureShared
-- Name: 2289aeae8261
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 21, "\000")
return mp.INFECTED
