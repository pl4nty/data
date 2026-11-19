-- Threat: !InfrastructureShared
-- Name: 4c7860b10c15
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
