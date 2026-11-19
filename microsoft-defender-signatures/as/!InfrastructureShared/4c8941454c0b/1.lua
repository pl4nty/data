-- Threat: !InfrastructureShared
-- Name: 4c8941454c0b
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 14, "\141\r")
local l_0_0 = pe.mmap_va(pevars.sigaddr + 21, 1)
local l_0_1 = pevars.sigaddr + 20 + string.byte(l_0_0, 1) + 2 - 2
pe.mmap_patch_va(pevars.sigaddr + 20, "\144\144")
pe.mmap_patch_va(l_0_1, "\144\144")
return mp.INFECTED
