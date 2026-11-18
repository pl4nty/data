-- Threat: !InfrastructureShared
-- Name: 85782f18827a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
