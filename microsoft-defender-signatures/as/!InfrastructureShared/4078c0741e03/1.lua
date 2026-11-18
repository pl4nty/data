-- Threat: !InfrastructureShared
-- Name: 4078c0741e03
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
