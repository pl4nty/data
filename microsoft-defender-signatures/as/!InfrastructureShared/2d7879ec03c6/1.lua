-- Threat: !InfrastructureShared
-- Name: 2d7879ec03c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
