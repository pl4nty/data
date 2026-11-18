-- Threat: !InfrastructureShared
-- Name: 2278180507d4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
