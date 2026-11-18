-- Threat: !InfrastructureShared
-- Name: 9f78d1571bfa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
