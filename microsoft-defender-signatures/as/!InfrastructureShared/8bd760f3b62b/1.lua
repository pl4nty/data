-- Threat: !InfrastructureShared
-- Name: 8bd760f3b62b
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "AttackIQ") or IsBasToolProcessFoundInParents("CMDHSTR", "AttackIQ", 4) then
  return mp.INFECTED
end
return mp.CLEAN
