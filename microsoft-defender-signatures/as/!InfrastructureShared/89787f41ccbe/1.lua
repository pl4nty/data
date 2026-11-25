-- Threat: !InfrastructureShared
-- Name: 89787f41ccbe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
