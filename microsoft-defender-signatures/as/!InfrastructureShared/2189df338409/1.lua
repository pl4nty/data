-- Threat: !InfrastructureShared
-- Name: 2189df338409
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 64), "u", 21, true)
pe.mmap_patch_va(pevars.sigaddr + l_0_0, "3\255")
return mp.INFECTED
