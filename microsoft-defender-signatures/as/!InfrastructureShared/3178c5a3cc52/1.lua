-- Threat: !InfrastructureShared
-- Name: 3178c5a3cc52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
