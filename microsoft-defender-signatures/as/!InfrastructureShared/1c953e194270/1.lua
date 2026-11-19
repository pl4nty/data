-- Threat: !InfrastructureShared
-- Name: 1c953e194270
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 40)
local l_0_1 = string.sub(l_0_0, 17, 17)
pe.mmap_patch_va(pevars.sigaddr + 14, "\187" .. l_0_1 .. "\000\000\000")
return mp.INFECTED
