-- Threat: !InfrastructureShared
-- Name: 10578dc74c8cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
