-- Threat: !InfrastructureShared
-- Name: 4078ceff725a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
