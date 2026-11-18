-- Threat: !InfrastructureShared
-- Name: 6478f372b103
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
