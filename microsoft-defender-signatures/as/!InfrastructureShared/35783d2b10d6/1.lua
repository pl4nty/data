-- Threat: !InfrastructureShared
-- Name: 35783d2b10d6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
