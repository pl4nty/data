-- Threat: !InfrastructureShared
-- Name: bd783f1126ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
