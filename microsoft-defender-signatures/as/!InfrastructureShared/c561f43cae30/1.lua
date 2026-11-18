-- Threat: !InfrastructureShared
-- Name: c561f43cae30
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
