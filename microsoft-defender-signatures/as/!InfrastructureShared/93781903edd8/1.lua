-- Threat: !InfrastructureShared
-- Name: 93781903edd8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
