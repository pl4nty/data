-- Threat: !InfrastructureShared
-- Name: fd78d7bd1398
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
