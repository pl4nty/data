-- Threat: !InfrastructureShared
-- Name: 50787648fb0f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
