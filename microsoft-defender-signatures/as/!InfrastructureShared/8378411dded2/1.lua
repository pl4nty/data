-- Threat: !InfrastructureShared
-- Name: 8378411dded2
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
