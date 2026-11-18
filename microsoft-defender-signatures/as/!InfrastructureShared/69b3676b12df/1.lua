-- Threat: !InfrastructureShared
-- Name: 69b3676b12df
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3 ~= nil and l_0_3 ~= "" and StringEndsWith(l_0_3, ".js") then
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if sysio.IsFileExists(l_0_3) then
        local l_0_4, l_0_5 = mp.GetMotwReferrerUrlForFile(l_0_3)
        if not l_0_4 then
          return mp.CLEAN
        end
        if not l_0_5 or StringStartsWith(l_0_5, "http") or StringStartsWith(l_0_5, "www") then
          return mp.CLEAN
        end
        if sysio.IsFileExists(l_0_5) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
