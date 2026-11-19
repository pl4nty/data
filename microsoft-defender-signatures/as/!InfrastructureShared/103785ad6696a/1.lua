-- Threat: !InfrastructureShared
-- Name: 103785ad6696a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
