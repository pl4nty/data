-- Threat: !InfrastructureShared
-- Name: 2289612802ee
-- Type: 21

local l_0_0 = pe.get_regval(pe.REG_EIP)
local l_0_1 = pe.get_regval(pe.REG_ESP)
if peattributes.isdll and l_0_0 > l_0_1 and l_0_0 - l_0_1 < 512 and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.LOWFI
end
return mp.CLEAN
