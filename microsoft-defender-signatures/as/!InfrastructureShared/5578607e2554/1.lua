-- Threat: !InfrastructureShared
-- Name: 5578607e2554
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
