-- Threat: !InfrastructureShared
-- Name: 3178ac531840
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
