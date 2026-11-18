-- Threat: !InfrastructureShared
-- Name: 55786a63bd66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
