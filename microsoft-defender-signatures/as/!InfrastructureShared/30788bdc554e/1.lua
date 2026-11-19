-- Threat: !InfrastructureShared
-- Name: 30788bdc554e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
