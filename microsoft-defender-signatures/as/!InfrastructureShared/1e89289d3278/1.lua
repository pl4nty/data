-- Threat: !InfrastructureShared
-- Name: 1e89289d3278
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 1, "\002")
return mp.INFECTED
