-- Threat: !InfrastructureShared
-- Name: 2e7890a89836
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
