-- Threat: !InfrastructureShared
-- Name: 11178d2bf90e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
