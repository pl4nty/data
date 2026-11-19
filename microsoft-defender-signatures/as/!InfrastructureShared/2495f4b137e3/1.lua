-- Threat: !InfrastructureShared
-- Name: 2495f4b137e3
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 80)
local l_0_1 = mp.readu_u32(l_0_0, 31) - 1
pe.set_regval(pe.REG_ECX, l_0_1)
return mp.CLEAN
