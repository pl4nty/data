-- Threat: !InfrastructureShared
-- Name: 4678397f5eee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
