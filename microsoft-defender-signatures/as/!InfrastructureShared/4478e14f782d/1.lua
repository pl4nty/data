-- Threat: !InfrastructureShared
-- Name: 4478e14f782d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
