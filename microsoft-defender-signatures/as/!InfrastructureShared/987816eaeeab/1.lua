-- Threat: !InfrastructureShared
-- Name: 987816eaeeab
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) or mp.HSTR_CALLER_SMS ~= l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
