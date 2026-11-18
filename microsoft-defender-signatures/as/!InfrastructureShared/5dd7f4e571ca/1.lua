-- Threat: !InfrastructureShared
-- Name: 5dd7f4e571ca
-- Type: 21

if mp.IsHipsRuleEnabled("9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2") ~= true then
  return mp.CLEAN
end
return mp.INFECTED
