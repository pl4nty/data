-- Threat: !InfrastructureShared
-- Name: 80788d01fd6d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
