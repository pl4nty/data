-- Threat: !InfrastructureShared
-- Name: 21954acb46b1
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 21, 21)
pe.mmap_patch_va(pevars.sigaddr + 18, "\187" .. l_0_1 .. "\000\000\000\144\144\144")
return mp.INFECTED
