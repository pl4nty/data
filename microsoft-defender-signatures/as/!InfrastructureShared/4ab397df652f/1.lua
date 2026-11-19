-- Threat: !InfrastructureShared
-- Name: 4ab397df652f
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = 600
  local l_0_2 = 10
  AppendToRollingQueue("TEAMS_CALL_PLACED", "Meeting", l_0_0, l_0_1, l_0_2, 0)
end
return mp.CLEAN
