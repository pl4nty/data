-- Threat: !InfrastructureShared
-- Name: 37894e8062f9
-- Type: 21

mp.set_mpattribute("lua_codepatch_tibs_5")
local l_0_0 = pe.mmap_va(pevars.sigaddr, 22)
local l_0_1 = mp.readu_u32(l_0_0, 7)
local l_0_2 = mp.readu_u32(l_0_0, 18)
local l_0_3 = pe.get_regval(pe.REG_EDX)
local l_0_4 = l_0_3 - mp.bitxor(l_0_2, l_0_1) - 1
pe.set_regval(pe.REG_EBX, l_0_4)
return mp.INFECTED
