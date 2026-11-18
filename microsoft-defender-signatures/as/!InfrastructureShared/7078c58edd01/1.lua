-- Threat: !InfrastructureShared
-- Name: 7078c58edd01
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
