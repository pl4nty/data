-- Threat: !InfrastructureShared
-- Name: 93783925d50f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
