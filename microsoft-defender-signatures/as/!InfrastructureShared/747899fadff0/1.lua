-- Threat: !InfrastructureShared
-- Name: 747899fadff0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
