-- Threat: !InfrastructureShared
-- Name: 6d787a8a3074
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
