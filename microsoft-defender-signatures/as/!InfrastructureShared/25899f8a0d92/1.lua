-- Threat: !InfrastructureShared
-- Name: 25899f8a0d92
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 16, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
