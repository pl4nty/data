-- Threat: !InfrastructureShared
-- Name: 8c78a80ce923
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
