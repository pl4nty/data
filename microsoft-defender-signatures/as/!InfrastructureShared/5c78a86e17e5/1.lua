-- Threat: !InfrastructureShared
-- Name: 5c78a86e17e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
