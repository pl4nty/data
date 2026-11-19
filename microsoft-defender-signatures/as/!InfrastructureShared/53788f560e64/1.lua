-- Threat: !InfrastructureShared
-- Name: 53788f560e64
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
