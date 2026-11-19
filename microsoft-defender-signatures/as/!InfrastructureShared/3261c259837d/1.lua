-- Threat: !InfrastructureShared
-- Name: 3261c259837d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
