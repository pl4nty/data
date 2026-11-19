-- Threat: !InfrastructureShared
-- Name: 4289a29f9028
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 3, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
pe.mmap_patch_va(l_0_1, "\221\a")
return mp.INFECTED
