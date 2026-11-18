-- Threat: !InfrastructureShared
-- Name: a678d620ca48
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
