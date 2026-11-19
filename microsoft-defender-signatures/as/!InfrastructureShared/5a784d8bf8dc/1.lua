-- Threat: !InfrastructureShared
-- Name: 5a784d8bf8dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
