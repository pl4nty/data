-- Threat: !InfrastructureShared
-- Name: 3c787b2111bd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
