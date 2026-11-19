-- Threat: !InfrastructureShared
-- Name: 5578873c7ff7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
