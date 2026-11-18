-- Threat: !InfrastructureShared
-- Name: 7378f25cf2de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
