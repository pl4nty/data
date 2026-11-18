-- Threat: !InfrastructureShared
-- Name: a0785ce819c7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
