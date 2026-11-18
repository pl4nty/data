-- Threat: !InfrastructureShared
-- Name: 2489b6d868c4
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 11, "\1397")
pe.mmap_patch_va(pevars.sigaddr + 15, "\144\144")
return mp.INFECTED
