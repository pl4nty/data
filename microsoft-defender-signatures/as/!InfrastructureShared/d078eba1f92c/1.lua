-- Threat: !InfrastructureShared
-- Name: d078eba1f92c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
