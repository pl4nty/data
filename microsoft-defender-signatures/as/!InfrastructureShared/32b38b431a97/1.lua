-- Threat: !InfrastructureShared
-- Name: 32b38b431a97
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_2 = this_sigattrlog[1].utf8p2
  if not l_0_2 then
    return mp.CLEAN
  end
  _, l_0_0 = MpCommon.StringRegExpSearch("(?i)binPath=[\\s'\\\"\\\\]+(.*\\.\\w+)", l_0_2)
  l_0_1 = string.lower(l_0_2):match("create(.*)binpath")
end
if not l_0_0 then
  return mp.CLEAN
end
AppendToRollingQueue("NewlyRegisteredServices", l_0_0, true, 3600, 20)
if l_0_1 then
  AppendToRollingQueue("NewlyRegisteredServices_Name", l_0_1, true, 3600, 20)
end
return mp.CLEAN
