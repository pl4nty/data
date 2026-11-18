-- Threat: !InfrastructureShared
-- Name: 24787d4e7e87
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
