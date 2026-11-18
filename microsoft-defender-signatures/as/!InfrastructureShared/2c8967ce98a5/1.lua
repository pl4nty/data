-- Threat: !InfrastructureShared
-- Name: 2c8967ce98a5
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 10, "\144\144")
pe.mmap_patch_va(pevars.sigaddr + 22, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
