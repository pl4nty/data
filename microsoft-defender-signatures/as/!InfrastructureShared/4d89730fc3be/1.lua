-- Threat: !InfrastructureShared
-- Name: 4d89730fc3be
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\198\005")
pe.mmap_patch_va(pevars.sigaddr + 13, "\144\144")
return mp.INFECTED
