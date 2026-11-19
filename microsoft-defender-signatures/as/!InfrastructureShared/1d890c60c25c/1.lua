-- Threat: !InfrastructureShared
-- Name: 1d890c60c25c
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 6, "\144\144")
pe.mmap_patch_va(pevars.sigaddr + 12, "\235")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
