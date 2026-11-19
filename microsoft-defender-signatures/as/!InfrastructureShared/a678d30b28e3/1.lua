-- Threat: !InfrastructureShared
-- Name: a678d30b28e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
