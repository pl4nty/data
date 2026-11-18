-- Threat: !InfrastructureShared
-- Name: 657828380a79
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
