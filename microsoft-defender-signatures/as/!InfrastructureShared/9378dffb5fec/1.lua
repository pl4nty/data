-- Threat: !InfrastructureShared
-- Name: 9378dffb5fec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
