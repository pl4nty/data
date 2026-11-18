-- Threat: !InfrastructureShared
-- Name: 71d772533804
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "AttackIQ") or IsBasToolProcessFoundInParents("CMDHSTR", "AttackIQ", 4) then
  return mp.INFECTED
end
return mp.CLEAN
