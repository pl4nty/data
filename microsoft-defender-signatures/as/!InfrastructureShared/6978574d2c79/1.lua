-- Threat: !InfrastructureShared
-- Name: 6978574d2c79
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
