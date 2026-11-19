-- Threat: !InfrastructureShared
-- Name: f6788d8a7db5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
