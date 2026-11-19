-- Threat: !InfrastructureShared
-- Name: eeb3e18f7fc4
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if GetRollingQueueCount("HumYam-Successful-Logon-Ip-Counter") >= 1000 then
  return mp.CLEAN
end
local l_0_0 = parseLogonEvent(this_sigattrlog[5])
local l_0_1 = getIpAddressClass(l_0_0.Ip)
if l_0_1 == 2 or l_0_1 == 8 then
  return mp.CLEAN
end
AppendToRollingQueue("HumYam-Successful-Logon-Ip-Counter", l_0_0.Ip, 0, 604800, 1000, 1)
return mp.INFECTED
