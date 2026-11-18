-- Threat: !InfrastructureShared
-- Name: 1395efce7357
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EBP) - 4
local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
pe.set_regval(pe.REG_EBX, l_0_1 + 1)
return mp.INFECTED
