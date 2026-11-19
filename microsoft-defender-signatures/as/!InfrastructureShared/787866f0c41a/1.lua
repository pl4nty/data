-- Threat: !InfrastructureShared
-- Name: 787866f0c41a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
