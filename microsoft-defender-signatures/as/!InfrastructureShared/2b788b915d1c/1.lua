-- Threat: !InfrastructureShared
-- Name: 2b788b915d1c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
