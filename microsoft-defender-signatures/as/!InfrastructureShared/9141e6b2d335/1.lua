-- Threat: !InfrastructureShared
-- Name: 9141e6b2d335
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[3].utf8p1
  local l_0_1 = this_sigattrlog[3].utf8p2
  AppendToRollingQueue("ExternalRemoteService_Path", l_0_0, 1, 60)
  AppendToRollingQueue("ExternalRemoteService_PPid", l_0_1, 1, 60)
  return mp.INFECTED
end
return mp.CLEAN
