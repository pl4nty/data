-- Threat: !InfrastructureShared
-- Name: 1789628cbfbb
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 10, "\235")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
