-- Threat: !InfrastructureShared
-- Name: 3278af6ffc02
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
