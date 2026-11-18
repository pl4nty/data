-- Threat: !InfrastructureShared
-- Name: 75d7b2c4927d
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "AttackIQ") or IsBasToolProcessFoundInParents("CMDHSTR", "AttackIQ", 4) then
  return mp.INFECTED
end
return mp.CLEAN
