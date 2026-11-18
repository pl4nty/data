-- Threat: !InfrastructureShared
-- Name: 8fb335ed42e2
-- Type: 21

if mp.IsHipsRuleEnabled("d4f940ab-401b-4efc-aadc-ad5f3c50688a") == true then
  return mp.INFECTED
end
return mp.CLEAN
