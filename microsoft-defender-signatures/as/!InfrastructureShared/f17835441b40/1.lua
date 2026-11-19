-- Threat: !InfrastructureShared
-- Name: f17835441b40
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
