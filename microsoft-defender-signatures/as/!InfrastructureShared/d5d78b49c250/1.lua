-- Threat: !InfrastructureShared
-- Name: d5d78b49c250
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "Picus") or IsBasToolProcessFoundInParents("CMDHSTR", "Picus", 4) then
  return mp.INFECTED
end
return mp.CLEAN
