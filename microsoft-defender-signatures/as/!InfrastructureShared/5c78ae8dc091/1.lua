-- Threat: !InfrastructureShared
-- Name: 5c78ae8dc091
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
