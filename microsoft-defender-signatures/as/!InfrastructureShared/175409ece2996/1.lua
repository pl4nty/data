-- Threat: !InfrastructureShared
-- Name: 175409ece2996
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
