-- Threat: !InfrastructureShared
-- Name: 75b38156e82e
-- Type: 21

if mp.IsHipsRuleEnabled("d4f940ab-401b-4efc-aadc-ad5f3c50688a") == true then
  return mp.INFECTED
end
return mp.CLEAN
