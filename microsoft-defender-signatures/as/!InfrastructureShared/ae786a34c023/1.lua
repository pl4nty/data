-- Threat: !InfrastructureShared
-- Name: ae786a34c023
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
