-- Threat: !InfrastructureShared
-- Name: d678a6b7a3f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
