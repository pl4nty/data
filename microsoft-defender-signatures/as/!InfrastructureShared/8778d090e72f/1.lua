-- Threat: !InfrastructureShared
-- Name: 8778d090e72f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
