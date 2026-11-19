-- Threat: !InfrastructureShared
-- Name: 29785116f1ed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
