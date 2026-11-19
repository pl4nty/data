-- Threat: !InfrastructureShared
-- Name: 5978b6cfe16f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
