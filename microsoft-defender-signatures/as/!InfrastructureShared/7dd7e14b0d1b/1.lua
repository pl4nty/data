-- Threat: !InfrastructureShared
-- Name: 7dd7e14b0d1b
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "Picus") or IsBasToolProcessFoundInParents("CMDHSTR", "Picus", 4) then
  return mp.INFECTED
end
return mp.CLEAN
