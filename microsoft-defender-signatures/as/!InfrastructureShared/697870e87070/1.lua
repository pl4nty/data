-- Threat: !InfrastructureShared
-- Name: 697870e87070
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
