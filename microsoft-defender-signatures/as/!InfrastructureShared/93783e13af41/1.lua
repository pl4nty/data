-- Threat: !InfrastructureShared
-- Name: 93783e13af41
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
