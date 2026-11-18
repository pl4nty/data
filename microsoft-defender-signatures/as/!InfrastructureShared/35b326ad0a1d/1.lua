-- Threat: !InfrastructureShared
-- Name: 35b326ad0a1d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.GetMemQueryCount())
if l_0_1 ~= nil and 0 < l_0_1 then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
