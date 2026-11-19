-- Threat: !InfrastructureShared
-- Name: cc61ac597b60
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
return mp.INFECTED
