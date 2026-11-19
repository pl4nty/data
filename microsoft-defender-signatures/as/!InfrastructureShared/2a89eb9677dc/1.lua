-- Threat: !InfrastructureShared
-- Name: 2a89eb9677dc
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 12, "\016\000\000")
return mp.INFECTED
