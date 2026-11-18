-- Threat: !InfrastructureShared
-- Name: a778c87d3464
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
