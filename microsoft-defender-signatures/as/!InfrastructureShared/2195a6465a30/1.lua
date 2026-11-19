-- Threat: !InfrastructureShared
-- Name: 2195a6465a30
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.sub(l_0_0, 19, 19)
pe.mmap_patch_va(pevars.sigaddr + 16, "\187" .. l_0_1 .. "\000\000\000\144\144\144")
return mp.INFECTED
