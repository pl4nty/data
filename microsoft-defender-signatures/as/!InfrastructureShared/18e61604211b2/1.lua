-- Threat: !InfrastructureShared
-- Name: 18e61604211b2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
