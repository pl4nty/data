-- Threat: !InfrastructureShared
-- Name: 115d76c5a7f5c
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach", "AccessibilityEscalation") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 3, "AccessibilityEscalation") then
  return mp.INFECTED
end
return mp.CLEAN
