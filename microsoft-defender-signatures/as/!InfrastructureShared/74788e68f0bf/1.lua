-- Threat: !InfrastructureShared
-- Name: 74788e68f0bf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
