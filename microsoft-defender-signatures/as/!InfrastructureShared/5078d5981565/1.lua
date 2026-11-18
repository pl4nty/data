-- Threat: !InfrastructureShared
-- Name: 5078d5981565
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
