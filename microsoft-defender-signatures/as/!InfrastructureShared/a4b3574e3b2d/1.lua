-- Threat: !InfrastructureShared
-- Name: a4b3574e3b2d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if not this_sigattrlog[1].matched and not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_1 = {min = 1, max = 5}
if not QueryProcContext({"BROWSER"}, l_0_1) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
