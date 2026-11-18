-- Threat: !InfrastructureShared
-- Name: 966114a39167
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
