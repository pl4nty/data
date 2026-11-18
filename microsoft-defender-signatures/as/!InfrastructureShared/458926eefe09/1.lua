-- Threat: !InfrastructureShared
-- Name: 458926eefe09
-- Type: 21

mp.set_mpattribute("lua_codepatch_tibs_14")
local l_0_0 = pe.mmap_va(pe.get_regval(pe.REG_EBP) - 4, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
l_0_0 = pe.mmap_va(pevars.sigaddr, 36)
local l_0_2 = mp.readu_u32(l_0_0, 6)
local l_0_3 = string.byte(l_0_0, 14)
local l_0_4 = mp.readu_u32(l_0_0, 18)
local l_0_5 = mp.readu_u32(l_0_0, 29)
local l_0_6 = pe.get_regval(pe.REG_EDX)
local l_0_7 = mp.ror32(l_0_6, l_0_3) - mp.bitxor(l_0_5, l_0_4) + l_0_1 - l_0_2
pe.set_regval(pe.REG_EBX, l_0_7)
return mp.INFECTED
