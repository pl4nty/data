-- Threat: !InfrastructureShared
-- Name: 4078378a86a6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
