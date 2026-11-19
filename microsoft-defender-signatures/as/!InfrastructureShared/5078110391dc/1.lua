-- Threat: !InfrastructureShared
-- Name: 5078110391dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
