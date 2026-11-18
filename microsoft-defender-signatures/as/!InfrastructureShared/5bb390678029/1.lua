-- Threat: !InfrastructureShared
-- Name: 5bb390678029
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
local l_0_2 = {
  [".one"] = true
}
bm_AddRelatedFileFromCommandLine(l_0_1, l_0_2, nil, 6)
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) and checkFileLastWriteTime(l_0_5, 600) == false then
      bm.add_threat_file(l_0_5)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
