-- Threat: !InfrastructureShared
-- Name: 5078cac1087b
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
