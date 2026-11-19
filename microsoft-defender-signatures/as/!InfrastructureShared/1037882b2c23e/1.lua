-- Threat: !InfrastructureShared
-- Name: 1037882b2c23e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
