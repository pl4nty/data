-- Threat: !InfrastructureShared
-- Name: 13e782c862d18
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
