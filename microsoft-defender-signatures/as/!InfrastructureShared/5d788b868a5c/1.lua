-- Threat: !InfrastructureShared
-- Name: 5d788b868a5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
