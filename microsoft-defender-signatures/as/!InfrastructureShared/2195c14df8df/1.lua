-- Threat: !InfrastructureShared
-- Name: 2195c14df8df
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EBX)
local l_0_1 = pe.get_regval(pe.REG_ECX) - (4294967295 - l_0_0)
l_0_0 = 4294967295
pe.set_regval(pe.REG_EAX, 0)
pe.set_regval(pe.REG_EBX, l_0_0)
pe.set_regval(pe.REG_ECX, l_0_1)
return mp.CLEAN
