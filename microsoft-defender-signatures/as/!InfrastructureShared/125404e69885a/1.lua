-- Threat: !InfrastructureShared
-- Name: 125404e69885a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
