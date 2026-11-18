-- Threat: !InfrastructureShared
-- Name: 1247855da4f50
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
