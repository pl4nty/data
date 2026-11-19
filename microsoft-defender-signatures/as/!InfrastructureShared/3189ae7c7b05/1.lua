-- Threat: !InfrastructureShared
-- Name: 3189ae7c7b05
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 20), "u", 1, true) - 1
local l_0_1 = string.find(pe.mmap_va(pevars.sigaddr, 96), "u", 80, true)
l_0_1 = l_0_1 - l_0_0 - 1
local l_0_2 = string.format("\235%s", string.char(l_0_1))
pe.mmap_patch_va(pevars.sigaddr + l_0_0, l_0_2)
return mp.INFECTED
