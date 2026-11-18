-- Threat: !InfrastructureShared
-- Name: 3e8993605142
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 20, "\144\144")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.CLEAN
