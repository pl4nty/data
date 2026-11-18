-- Threat: !InfrastructureShared
-- Name: 37784ce81d84
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
