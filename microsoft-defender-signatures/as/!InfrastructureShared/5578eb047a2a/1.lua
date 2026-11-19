-- Threat: !InfrastructureShared
-- Name: 5578eb047a2a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
