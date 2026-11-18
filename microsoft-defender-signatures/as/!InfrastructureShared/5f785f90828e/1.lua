-- Threat: !InfrastructureShared
-- Name: 5f785f90828e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
