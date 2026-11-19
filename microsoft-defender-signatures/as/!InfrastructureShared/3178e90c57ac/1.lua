-- Threat: !InfrastructureShared
-- Name: 3178e90c57ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
