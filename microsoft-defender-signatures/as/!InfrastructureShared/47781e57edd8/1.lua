-- Threat: !InfrastructureShared
-- Name: 47781e57edd8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
