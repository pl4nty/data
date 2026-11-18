-- Threat: !InfrastructureShared
-- Name: 2289f95c3561
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 14, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
