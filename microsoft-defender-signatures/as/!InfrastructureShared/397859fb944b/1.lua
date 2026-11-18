-- Threat: !InfrastructureShared
-- Name: 397859fb944b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
