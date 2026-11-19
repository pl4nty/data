-- Threat: !InfrastructureShared
-- Name: 4f780997f248
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
