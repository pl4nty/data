-- Threat: !InfrastructureShared
-- Name: 9b7819c3f8ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
