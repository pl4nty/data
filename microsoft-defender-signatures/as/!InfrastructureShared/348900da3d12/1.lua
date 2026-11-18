-- Threat: !InfrastructureShared
-- Name: 348900da3d12
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 12, "\235\024")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
