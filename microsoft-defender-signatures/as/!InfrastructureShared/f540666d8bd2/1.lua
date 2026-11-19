-- Threat: !InfrastructureShared
-- Name: f540666d8bd2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
