-- Threat: !InfrastructureShared
-- Name: 5678f9b48497
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
