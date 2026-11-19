-- Threat: !InfrastructureShared
-- Name: 29787fa72d68
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
