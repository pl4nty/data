-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b31d3d486f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.RollingQueueCount)("TamperingAlerts")
if l_0_0 ~= nil and l_0_0 >= 4 then
  return mp.INFECTED
end
if GetRollingQueueKeys("TamperingAlerts_LimitedSet_A") ~= nil or GetRollingQueueKeys("TamperingAlerts_LimitedSet_B") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

