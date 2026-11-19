-- Threat: !InfrastructureShared
-- Name: aed7fb9335e5
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "Picus") or IsBasToolProcessFoundInParents("CMDHSTR", "Picus", 4) then
  return mp.INFECTED
end
return mp.CLEAN
