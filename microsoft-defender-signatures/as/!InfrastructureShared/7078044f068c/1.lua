-- Threat: !InfrastructureShared
-- Name: 7078044f068c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
