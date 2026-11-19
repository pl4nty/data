-- Threat: !InfrastructureShared
-- Name: 22781af9fd38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
