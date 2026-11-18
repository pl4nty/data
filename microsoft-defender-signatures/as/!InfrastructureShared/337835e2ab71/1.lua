-- Threat: !InfrastructureShared
-- Name: 337835e2ab71
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
