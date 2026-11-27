-- Threat: !InfrastructureShared
-- Name: 15540420f7a2d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
