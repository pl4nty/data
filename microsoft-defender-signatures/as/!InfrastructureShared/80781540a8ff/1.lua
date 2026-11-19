-- Threat: !InfrastructureShared
-- Name: 80781540a8ff
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
