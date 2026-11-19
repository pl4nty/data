-- Threat: !InfrastructureShared
-- Name: 47787f862c04
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
