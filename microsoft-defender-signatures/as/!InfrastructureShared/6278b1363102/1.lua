-- Threat: !InfrastructureShared
-- Name: 6278b1363102
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
