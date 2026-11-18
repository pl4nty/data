-- Threat: !InfrastructureShared
-- Name: 5578838551a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
