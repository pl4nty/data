-- Threat: !InfrastructureShared
-- Name: 62788b66b717
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
