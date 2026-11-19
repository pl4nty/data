-- Threat: !InfrastructureShared
-- Name: 3f78b3b44d9d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
