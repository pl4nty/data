-- Threat: !InfrastructureShared
-- Name: 99b35a58db0a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = reportSessionInformation()
if l_0_0.Session.ClientProtocolType == 2 then
  return mp.INFECTED
end
return mp.CLEAN
