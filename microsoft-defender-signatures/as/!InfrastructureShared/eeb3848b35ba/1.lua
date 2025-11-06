-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eeb3848b35ba\1.luac 

-- params : ...
-- function num : 0
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

