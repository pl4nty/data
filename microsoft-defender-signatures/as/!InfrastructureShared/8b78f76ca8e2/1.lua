-- Threat: !InfrastructureShared
-- Name: 8b78f76ca8e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
