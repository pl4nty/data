-- Threat: !InfrastructureShared
-- Name: 4b78ac65f785
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
