-- Threat: !InfrastructureShared
-- Name: 15f78aeba5bb7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
