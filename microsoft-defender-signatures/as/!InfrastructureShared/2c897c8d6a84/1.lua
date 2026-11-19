-- Threat: !InfrastructureShared
-- Name: 2c897c8d6a84
-- Type: 21

mp.set_mpattribute("lua_codepatch_tibs_4")
pe.mmap_patch_va(pevars.sigaddr + 11, "\000")
return mp.INFECTED
