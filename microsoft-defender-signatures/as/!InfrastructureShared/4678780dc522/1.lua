-- Threat: !InfrastructureShared
-- Name: 4678780dc522
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
