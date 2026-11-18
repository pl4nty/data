-- Threat: !InfrastructureShared
-- Name: 337804f2ece5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
