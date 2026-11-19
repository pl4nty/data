-- Threat: !InfrastructureShared
-- Name: 5bb3d3bc49a4
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

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
bm_AddRelatedFileFromCommandLine(l_0_1, l_0_2, nil, 1)
if l_0_0 ~= nil then
  local l_0_3 = extractDllForRegproc(l_0_0)
  if StringEndsWith(l_0_3, ".dll") then
    return mp.CLEAN
  end
  if l_0_3 and checkFileLastWriteTime(l_0_3, 600) == false and mp.IsKnownFriendlyFile(l_0_3, true, false) == false then
    bm.add_related_file(l_0_3)
    reportTimingData()
    return mp.INFECTED
  end
end
return mp.CLEAN
