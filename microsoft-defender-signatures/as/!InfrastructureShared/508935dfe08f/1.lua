-- Threat: !InfrastructureShared
-- Name: 508935dfe08f
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr, "\235+")
pe.mmap_patch_va(pevars.sigaddr + 45, "\249\144")
pe.mmap_patch_va(pevars.sigaddr + 53, "\235")
return mp.INFECTED
