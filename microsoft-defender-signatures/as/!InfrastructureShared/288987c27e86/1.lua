-- Threat: !InfrastructureShared
-- Name: 288987c27e86
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 3, "\235")
return mp.INFECTED
