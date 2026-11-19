-- Threat: !InfrastructureShared
-- Name: 6b7826eca173
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
