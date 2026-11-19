-- Threat: !InfrastructureShared
-- Name: 4f786a664f71
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
