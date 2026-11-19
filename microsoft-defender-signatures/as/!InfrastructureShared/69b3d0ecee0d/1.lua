-- Threat: !InfrastructureShared
-- Name: 69b3d0ecee0d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  bm_AddRelatedFileFromCommandLine(l_0_0, nil)
  AddResearchData(this_sigattrlog[1].ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
