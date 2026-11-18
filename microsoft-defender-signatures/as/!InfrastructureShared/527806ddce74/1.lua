-- Threat: !InfrastructureShared
-- Name: 527806ddce74
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
