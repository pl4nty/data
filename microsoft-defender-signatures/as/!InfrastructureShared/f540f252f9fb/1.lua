-- Threat: !InfrastructureShared
-- Name: f540f252f9fb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
