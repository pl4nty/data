-- Threat: !InfrastructureShared
-- Name: 9f7812065b7a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
