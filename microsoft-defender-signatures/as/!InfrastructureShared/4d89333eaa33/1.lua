-- Threat: !InfrastructureShared
-- Name: 4d89333eaa33
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 17, "\141\r")
local l_0_0 = pe.mmap_va(pevars.sigaddr + 24, 1)
local l_0_1 = pevars.sigaddr + 23 + string.byte(l_0_0, 1) + 2 - 2
pe.mmap_patch_va(pevars.sigaddr + 23, "\144\144")
pe.mmap_patch_va(l_0_1, "\144\144")
return mp.INFECTED
