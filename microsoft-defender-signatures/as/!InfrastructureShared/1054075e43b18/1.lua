-- Threat: !InfrastructureShared
-- Name: 1054075e43b18
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
