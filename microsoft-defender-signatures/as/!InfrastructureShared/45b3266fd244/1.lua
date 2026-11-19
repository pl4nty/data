-- Threat: !InfrastructureShared
-- Name: 45b3266fd244
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = reportSessionInformation()
if l_0_0.Session.ClientProtocolType == 2 then
  return mp.INFECTED
end
return mp.CLEAN
