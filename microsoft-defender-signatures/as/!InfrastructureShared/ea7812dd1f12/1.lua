-- Threat: !InfrastructureShared
-- Name: ea7812dd1f12
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
