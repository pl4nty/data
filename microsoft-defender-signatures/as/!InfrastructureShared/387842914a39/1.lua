-- Threat: !InfrastructureShared
-- Name: 387842914a39
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
