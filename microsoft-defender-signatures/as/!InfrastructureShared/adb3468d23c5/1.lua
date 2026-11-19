-- Threat: !InfrastructureShared
-- Name: adb3468d23c5
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1 = pcallEx("isCurrentProcessFriendly", isCurrentProcessFriendly)
if not l_0_0 then
  reportPcallEx()
  l_0_1 = false
end
if l_0_1 then
  return mp.CLEAN
end
bm.add_action("EmsScan", 5000)
return mp.INFECTED
