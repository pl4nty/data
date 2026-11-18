-- Threat: !InfrastructureShared
-- Name: 6878c7d36bd6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
