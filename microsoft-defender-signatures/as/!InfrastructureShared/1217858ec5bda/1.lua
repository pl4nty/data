-- Threat: !InfrastructureShared
-- Name: 1217858ec5bda
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
