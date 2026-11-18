-- Threat: !InfrastructureShared
-- Name: 8540ba25032b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
