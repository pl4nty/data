-- Threat: !InfrastructureShared
-- Name: 2f789b3a896a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
