-- Threat: !InfrastructureShared
-- Name: f540410f8a80
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
