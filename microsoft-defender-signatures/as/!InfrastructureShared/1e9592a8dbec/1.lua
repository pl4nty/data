-- Threat: !InfrastructureShared
-- Name: 1e9592a8dbec
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 19, 19)
pe.mmap_patch_va(pevars.sigaddr + 16, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
