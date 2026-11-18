-- Threat: !InfrastructureShared
-- Name: 2f95076b559d
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 64), "s", 1, true) - 1
pe.mmap_patch_va(pevars.sigaddr + l_0_0, "\235")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
