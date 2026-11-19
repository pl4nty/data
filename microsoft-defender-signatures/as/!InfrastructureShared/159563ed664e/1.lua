-- Threat: !InfrastructureShared
-- Name: 159563ed664e
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 40)
local l_0_1 = string.sub(l_0_0, 9, 9)
pe.mmap_patch_va(pevars.sigaddr + 6, "\187" .. l_0_1 .. "\000\000\000\144")
return mp.INFECTED
