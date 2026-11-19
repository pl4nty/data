-- Threat: !InfrastructureShared
-- Name: 4db3b0c697c1
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.len(l_0_0) >= 700 then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
