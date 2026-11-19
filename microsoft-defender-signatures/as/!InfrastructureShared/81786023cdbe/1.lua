-- Threat: !InfrastructureShared
-- Name: 81786023cdbe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
