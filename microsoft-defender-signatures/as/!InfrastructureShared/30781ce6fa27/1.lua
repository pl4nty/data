-- Threat: !InfrastructureShared
-- Name: 30781ce6fa27
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
