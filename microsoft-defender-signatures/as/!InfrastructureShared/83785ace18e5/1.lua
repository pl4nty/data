-- Threat: !InfrastructureShared
-- Name: 83785ace18e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
