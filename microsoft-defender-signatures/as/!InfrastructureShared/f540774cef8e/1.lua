-- Threat: !InfrastructureShared
-- Name: f540774cef8e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
