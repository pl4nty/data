-- Threat: !InfrastructureShared
-- Name: 11955f0671b6
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 8, "\144\144")
return mp.INFECTED
