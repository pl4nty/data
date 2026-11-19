-- Threat: !InfrastructureShared
-- Name: e0b309c212af
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = 1800
  local l_0_2 = 10
  AppendToRollingQueue("MpTamperRegKeyOldValues", "TreatAs", this_sigattrlog[1].utf8p1 .. "|" .. l_0_0, l_0_1, l_0_2)
end
return mp.INFECTED
