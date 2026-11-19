-- Threat: !InfrastructureShared
-- Name: 6eb3ea031f34
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  l_0_0 = l_0_4.ppid
  if l_0_0 and IsDetectionThresholdMet(l_0_0) and (IsTacticObservedForPid(l_0_0, "credentialdumping") or IsTacticObservedForPid(l_0_0, "impair_recovery")) then
    return mp.INFECTED
  end
end
return mp.CLEAN
