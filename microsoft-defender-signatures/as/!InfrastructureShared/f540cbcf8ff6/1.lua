-- Threat: !InfrastructureShared
-- Name: f540cbcf8ff6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
