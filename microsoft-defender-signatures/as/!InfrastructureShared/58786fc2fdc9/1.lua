-- Threat: !InfrastructureShared
-- Name: 58786fc2fdc9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
