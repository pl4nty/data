-- Threat: !InfrastructureShared
-- Name: 85d79a77e5c2
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "AttackIQ") or IsBasToolProcessFoundInParents("CMDHSTR", "AttackIQ", 4) then
  return mp.INFECTED
end
return mp.CLEAN
