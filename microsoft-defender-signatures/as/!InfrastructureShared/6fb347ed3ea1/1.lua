-- Threat: !InfrastructureShared
-- Name: 6fb347ed3ea1
-- Type: 21

if mp.IsHipsRuleEnabled("d4f940ab-401b-4efc-aadc-ad5f3c50688a") == true then
  return mp.INFECTED
end
return mp.CLEAN
