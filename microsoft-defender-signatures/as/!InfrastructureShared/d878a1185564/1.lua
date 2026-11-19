-- Threat: !InfrastructureShared
-- Name: d878a1185564
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
