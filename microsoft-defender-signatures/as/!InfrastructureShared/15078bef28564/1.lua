-- Threat: !InfrastructureShared
-- Name: 15078bef28564
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
