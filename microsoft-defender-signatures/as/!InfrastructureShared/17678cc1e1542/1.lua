-- Threat: !InfrastructureShared
-- Name: 17678cc1e1542
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
