-- Threat: !InfrastructureShared
-- Name: 2a95aaa562bd
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 28, 28)
pe.mmap_patch_va(pevars.sigaddr + 25, "\187" .. l_0_1 .. "\000\000\000\144\144\144")
return mp.INFECTED
