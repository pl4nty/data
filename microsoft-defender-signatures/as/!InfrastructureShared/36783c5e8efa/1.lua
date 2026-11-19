-- Threat: !InfrastructureShared
-- Name: 36783c5e8efa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
