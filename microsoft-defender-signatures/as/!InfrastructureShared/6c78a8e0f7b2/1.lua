-- Threat: !InfrastructureShared
-- Name: 6c78a8e0f7b2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
