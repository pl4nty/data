-- Threat: !InfrastructureShared
-- Name: 20783ad3f031
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
