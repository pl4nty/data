-- Threat: !InfrastructureShared
-- Name: 6389c4cdf92a
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 55, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
