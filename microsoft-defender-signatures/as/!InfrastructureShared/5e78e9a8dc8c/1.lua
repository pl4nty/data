-- Threat: !InfrastructureShared
-- Name: 5e78e9a8dc8c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
