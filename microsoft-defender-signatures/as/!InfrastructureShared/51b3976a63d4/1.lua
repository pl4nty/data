-- Threat: !InfrastructureShared
-- Name: 51b3976a63d4
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil and (StringEndsWith(l_0_0, ".vbs") or StringEndsWith(l_0_0, ".js")) then
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if IsKeyInRollingQueue("CC_filelist", l_0_1) and sysio.IsFileExists(l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN
