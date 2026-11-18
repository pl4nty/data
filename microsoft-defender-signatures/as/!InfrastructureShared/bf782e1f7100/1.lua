-- Threat: !InfrastructureShared
-- Name: bf782e1f7100
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
