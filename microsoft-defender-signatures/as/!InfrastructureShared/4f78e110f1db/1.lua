-- Threat: !InfrastructureShared
-- Name: 4f78e110f1db
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
