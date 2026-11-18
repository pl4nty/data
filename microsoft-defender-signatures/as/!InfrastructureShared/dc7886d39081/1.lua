-- Threat: !InfrastructureShared
-- Name: dc7886d39081
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
