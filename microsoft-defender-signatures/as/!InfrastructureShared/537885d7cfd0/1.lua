-- Threat: !InfrastructureShared
-- Name: 537885d7cfd0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
