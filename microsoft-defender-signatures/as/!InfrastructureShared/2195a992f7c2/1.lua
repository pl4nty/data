-- Threat: !InfrastructureShared
-- Name: 2195a992f7c2
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 21, 21)
pe.mmap_patch_va(pevars.sigaddr + 18, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
