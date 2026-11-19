-- Threat: !InfrastructureShared
-- Name: 2fbb330810b38
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "-enc", 1, true) ~= nil then
  TrackCommandLineAndTechnique(l_0_0, "T1547.001", 0, "PersistenceRegistryPowershellBlock")
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
