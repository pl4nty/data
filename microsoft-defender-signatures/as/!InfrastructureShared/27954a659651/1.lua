-- Threat: !InfrastructureShared
-- Name: 27954a659651
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 40)
local l_0_1 = string.sub(l_0_0, 15, 15)
pe.mmap_patch_va(pevars.sigaddr + 12, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
