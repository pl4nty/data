-- Threat: !InfrastructureShared
-- Name: 1795a0972fb9
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 40)
local l_0_1 = string.sub(l_0_0, 14, 14)
pe.mmap_patch_va(pevars.sigaddr + 11, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
