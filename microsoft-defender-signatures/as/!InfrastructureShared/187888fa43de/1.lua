-- Threat: !InfrastructureShared
-- Name: 187888fa43de
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
