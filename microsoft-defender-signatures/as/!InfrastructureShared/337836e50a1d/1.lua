-- Threat: !InfrastructureShared
-- Name: 337836e50a1d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
