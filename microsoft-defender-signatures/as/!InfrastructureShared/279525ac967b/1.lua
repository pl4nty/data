-- Threat: !InfrastructureShared
-- Name: 279525ac967b
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 28, 28)
pe.mmap_patch_va(pevars.sigaddr + 25, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
