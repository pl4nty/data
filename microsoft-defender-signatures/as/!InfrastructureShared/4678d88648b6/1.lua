-- Threat: !InfrastructureShared
-- Name: 4678d88648b6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
