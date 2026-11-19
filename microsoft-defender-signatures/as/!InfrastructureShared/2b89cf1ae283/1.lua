-- Threat: !InfrastructureShared
-- Name: 2b89cf1ae283
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 18, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
