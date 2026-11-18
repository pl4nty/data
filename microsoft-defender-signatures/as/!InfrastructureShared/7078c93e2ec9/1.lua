-- Threat: !InfrastructureShared
-- Name: 7078c93e2ec9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
