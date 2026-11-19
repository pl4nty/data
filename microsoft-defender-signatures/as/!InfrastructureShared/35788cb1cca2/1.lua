-- Threat: !InfrastructureShared
-- Name: 35788cb1cca2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
