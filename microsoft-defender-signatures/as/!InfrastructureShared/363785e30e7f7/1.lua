-- Threat: !InfrastructureShared
-- Name: 363785e30e7f7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
