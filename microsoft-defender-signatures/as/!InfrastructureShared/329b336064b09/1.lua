-- Threat: !InfrastructureShared
-- Name: 329b336064b09
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched then
  local l_0_0 = string.match(string.lower(this_sigattrlog[1].utf8p1), "microsoft.6365217ce6eb4_")
  AppendToRollingQueue("DefenderForIdentity", "Version", l_0_0, 31104000, 5)
elseif this_sigattrlog[2].matched then
  AppendToRollingQueue("DefenderForIdentity", "SupportedUsers", this_sigattrlog[2].np2, 31104000, 5)
elseif this_sigattrlog[3].matched then
  pcall(MpCommon.RollingQueueErase, "DefenderForIdentity")
end
return mp.CLEAN
