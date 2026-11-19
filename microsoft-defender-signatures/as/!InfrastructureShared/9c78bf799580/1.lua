-- Threat: !InfrastructureShared
-- Name: 9c78bf799580
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
