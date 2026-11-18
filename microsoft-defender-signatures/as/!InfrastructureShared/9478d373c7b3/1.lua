-- Threat: !InfrastructureShared
-- Name: 9478d373c7b3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
