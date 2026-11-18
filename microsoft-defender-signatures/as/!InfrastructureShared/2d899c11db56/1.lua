-- Threat: !InfrastructureShared
-- Name: 2d899c11db56
-- Type: 21

local l_0_0 = string.byte(pe.mmap_va(pevars.sigaddr + 4, 1), 1)
local l_0_1 = string.find(pe.mmap_va(pevars.sigaddr + l_0_0, 64), "\187\000\000\002\000", 1, true) - 1
pe.mmap_patch_va(pevars.sigaddr + l_0_1 + l_0_0, "3\219\144\144\144")
return mp.INFECTED
