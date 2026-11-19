-- Threat: !InfrastructureShared
-- Name: 4c78851b5f54
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
