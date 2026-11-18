-- Threat: !InfrastructureShared
-- Name: 5fd714baf50a
-- Type: 21
-- Includes: BasScenarioSpecificInfra

if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 4) then
  mp.changedetectionname(2153861156)
end
return mp.INFECTED
