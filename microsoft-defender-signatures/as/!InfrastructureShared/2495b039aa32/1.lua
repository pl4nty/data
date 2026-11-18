-- Threat: !InfrastructureShared
-- Name: 2495b039aa32
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 22, 22)
pe.mmap_patch_va(pevars.sigaddr + 19, "\187" .. l_0_1 .. "\000\000\000\144\144\144")
return mp.INFECTED
