-- Threat: !InfrastructureShared
-- Name: 6678eda29c3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
