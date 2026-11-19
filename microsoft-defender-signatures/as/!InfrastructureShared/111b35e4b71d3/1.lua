-- Threat: !InfrastructureShared
-- Name: 111b35e4b71d3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2:lower()
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2:lower()
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 and checkFileLastWriteTime(l_0_1, 3600) == false and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
