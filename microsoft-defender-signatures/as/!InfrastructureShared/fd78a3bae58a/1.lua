-- Threat: !InfrastructureShared
-- Name: fd78a3bae58a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
