-- Threat: !InfrastructureShared
-- Name: 1789f513ae92
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 10, "\235")
return mp.INFECTED
