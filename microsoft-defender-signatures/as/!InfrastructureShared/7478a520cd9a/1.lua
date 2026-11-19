-- Threat: !InfrastructureShared
-- Name: 7478a520cd9a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
