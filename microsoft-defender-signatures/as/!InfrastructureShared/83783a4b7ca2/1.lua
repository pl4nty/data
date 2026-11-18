-- Threat: !InfrastructureShared
-- Name: 83783a4b7ca2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
