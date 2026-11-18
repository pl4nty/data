-- Threat: !InfrastructureShared
-- Name: 4e78768a6769
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
