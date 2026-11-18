-- Threat: !InfrastructureShared
-- Name: f17880b94d5f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
