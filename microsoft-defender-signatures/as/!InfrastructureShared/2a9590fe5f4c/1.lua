-- Threat: !InfrastructureShared
-- Name: 2a9590fe5f4c
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 31, 31)
pe.mmap_patch_va(pevars.sigaddr + 28, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
