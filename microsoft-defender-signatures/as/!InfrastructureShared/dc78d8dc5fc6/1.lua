-- Threat: !InfrastructureShared
-- Name: dc78d8dc5fc6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
