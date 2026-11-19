-- Threat: !InfrastructureShared
-- Name: 3078a187e18b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
