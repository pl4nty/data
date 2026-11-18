-- Threat: !InfrastructureShared
-- Name: 100787b9932d6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
