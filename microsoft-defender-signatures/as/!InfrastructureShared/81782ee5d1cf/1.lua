-- Threat: !InfrastructureShared
-- Name: 81782ee5d1cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
