-- Threat: !InfrastructureShared
-- Name: 11e784ff50110
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
