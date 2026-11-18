-- Threat: !InfrastructureShared
-- Name: 5689f804d88a
-- Type: 21

mp.set_mpattribute("lua_codepatch_tibs_20")
local l_0_0 = pe.mmap_va(pe.get_regval(pe.REG_EBP) - 4, 4)
local l_0_1 = mp.readu_u32(l_0_0, 1)
l_0_0 = pe.mmap_va(pevars.sigaddr, 48)
local l_0_2 = mp.readu_u32(l_0_0, 6)
local l_0_3 = string.byte(l_0_0, 14)
local l_0_4 = string.byte(l_0_0, 17)
local l_0_5 = mp.readu_u32(l_0_0, 19)
local l_0_6 = string.byte(l_0_0, 25)
local l_0_7 = mp.readu_u32(l_0_0, 29)
local l_0_8 = mp.readu_u32(l_0_0, 40)
local l_0_9 = pe.get_regval(pe.REG_EDX)
local l_0_10 = mp.ror32(mp.ror32(l_0_9 - l_0_3, l_0_4) + l_0_5, l_0_6) - mp.bitxor(l_0_8, l_0_7) + l_0_1 - l_0_2
pe.set_regval(pe.REG_EBX, l_0_10)
return mp.INFECTED
