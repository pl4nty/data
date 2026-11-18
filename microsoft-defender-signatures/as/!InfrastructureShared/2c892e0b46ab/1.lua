-- Threat: !InfrastructureShared
-- Name: 2c892e0b46ab
-- Type: 21

local l_0_0 = string.find(pe.mmap_va(pevars.sigaddr, 64), "\187\000\000\002\000", 1, true) - 1
pe.mmap_patch_va(pevars.sigaddr + l_0_0, "\144\144\144\144\144")
return mp.INFECTED
