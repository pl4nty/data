-- Threat: !InfrastructureShared
-- Name: a4d7c5b2e517
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "Picus") or IsBasToolProcessFoundInParents("CMDHSTR", "Picus", 4) then
  return mp.INFECTED
end
return mp.CLEAN
