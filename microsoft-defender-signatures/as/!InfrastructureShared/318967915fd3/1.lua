-- Threat: !InfrastructureShared
-- Name: 318967915fd3
-- Type: 21

mp.set_mpattribute("FOPEX:Deep_Analysis_VMM_Grow")
pe.mmap_patch_va(pevars.sigaddr + 3, "\001\000\000\000")
return mp.CLEAN
