-- Threat: !InfrastructureShared
-- Name: 9ad7519eda5b
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "Picus") or IsBasToolProcessFoundInParents("CMDHSTR", "Picus", 4) then
  return mp.INFECTED
end
return mp.CLEAN
