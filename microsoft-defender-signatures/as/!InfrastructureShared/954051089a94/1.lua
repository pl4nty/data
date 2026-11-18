-- Threat: !InfrastructureShared
-- Name: 954051089a94
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
