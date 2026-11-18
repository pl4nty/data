-- Threat: !InfrastructureShared
-- Name: 30896add12fe
-- Type: 21

pe.mmap_patch_va(pevars.sigaddr + 9, "\141\r")
local l_0_0 = pe.mmap_va(pevars.sigaddr + 16, 1)
local l_0_1 = pevars.sigaddr + 15 + string.byte(l_0_0, 1) + 2 - 2
pe.mmap_patch_va(pevars.sigaddr + 15, "\144\144")
pe.mmap_patch_va(l_0_1, "\144\144")
return mp.INFECTED
