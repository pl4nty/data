-- Threat: !InfrastructureShared
-- Name: 537840bfc02c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
