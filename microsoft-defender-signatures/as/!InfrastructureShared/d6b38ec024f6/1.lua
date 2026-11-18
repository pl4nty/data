-- Threat: !InfrastructureShared
-- Name: d6b38ec024f6
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1 = pcallEx("isCurrentProcessFriendly", isCurrentProcessFriendly)
if not l_0_0 then
  reportPcallEx()
  l_0_1 = false
end
if not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
