-- Threat: !InfrastructureShared
-- Name: abd7ff1cd6ee
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 3) then
  return mp.INFECTED
end
return mp.CLEAN
