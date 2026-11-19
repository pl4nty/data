-- Threat: !InfrastructureShared
-- Name: 3f78b16d6e73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
