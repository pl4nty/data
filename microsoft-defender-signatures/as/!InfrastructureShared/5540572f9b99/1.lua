-- Threat: !InfrastructureShared
-- Name: 5540572f9b99
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
