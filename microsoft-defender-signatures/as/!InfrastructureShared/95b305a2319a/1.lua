-- Threat: !InfrastructureShared
-- Name: 95b305a2319a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetTaintLevelHR()
if l_0_0 == "High" and (mp.IsHipsRuleEnabled("01443614-cd74-433a-b99e-2ecdc07bfc25") or mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35")) then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
