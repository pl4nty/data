-- Threat: !InfrastructureShared
-- Name: 81783c79e990
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
