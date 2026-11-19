-- Threat: !InfrastructureShared
-- Name: 7078af1427f9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
