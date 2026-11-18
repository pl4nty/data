-- Threat: !InfrastructureShared
-- Name: c1b39b06b377
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = extractDllForRegproc(l_0_0)
  if l_0_1 and checkFileLastWriteTime(l_0_1, 600) == false and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
    bm.add_threat_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
