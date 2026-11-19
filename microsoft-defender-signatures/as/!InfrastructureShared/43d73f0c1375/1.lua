-- Threat: !InfrastructureShared
-- Name: 43d73f0c1375
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 4) then
  return mp.INFECTED
end
return mp.CLEAN
