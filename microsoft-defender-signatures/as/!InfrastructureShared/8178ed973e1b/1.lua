-- Threat: !InfrastructureShared
-- Name: 8178ed973e1b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
