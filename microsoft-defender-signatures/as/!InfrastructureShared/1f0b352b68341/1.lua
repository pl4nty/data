-- Threat: !InfrastructureShared
-- Name: 1f0b352b68341
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
if IsKeyInRollingQueue("AVExclusions", l_0_0) then
  AppendToRollingQueue("AVExclusions", l_0_0, "", 1, 1000)
end
return mp.CLEAN
