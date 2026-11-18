-- Threat: !InfrastructureShared
-- Name: 83785831a508
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
