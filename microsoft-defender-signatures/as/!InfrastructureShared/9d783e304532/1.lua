-- Threat: !InfrastructureShared
-- Name: 9d783e304532
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
