-- Threat: !InfrastructureShared
-- Name: 4b895c44e1b5
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 45, "Z")
pe.mmap_patch_va(pevars.sigaddr + 129, "Z")
return mp.INFECTED
