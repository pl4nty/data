-- Threat: !InfrastructureShared
-- Name: 4078b11d9b43
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
