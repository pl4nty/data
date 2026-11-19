-- Threat: !InfrastructureShared
-- Name: 85788ce0676b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
