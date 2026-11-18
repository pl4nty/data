-- Threat: !InfrastructureShared
-- Name: 155408237f27b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
