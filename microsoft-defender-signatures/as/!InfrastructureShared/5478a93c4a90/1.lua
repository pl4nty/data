-- Threat: !InfrastructureShared
-- Name: 5478a93c4a90
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
