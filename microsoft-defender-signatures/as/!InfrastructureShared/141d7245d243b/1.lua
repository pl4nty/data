-- Threat: !InfrastructureShared
-- Name: 141d7245d243b
-- Type: 21

if mp.IsHipsRuleEnabled("d1e49aac-8f56-4280-b9ba-993a6d77406c") ~= true then
  return mp.CLEAN
end
return mp.INFECTED
