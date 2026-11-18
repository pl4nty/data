-- Threat: !InfrastructureShared
-- Name: 7178e95a8e84
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
