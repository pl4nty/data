-- Threat: !InfrastructureShared
-- Name: 80786aa1485c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
