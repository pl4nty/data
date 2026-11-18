-- Threat: !InfrastructureShared
-- Name: b4b3e005237f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
