-- Threat: !InfrastructureShared
-- Name: 1cb78d2d1e10c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
