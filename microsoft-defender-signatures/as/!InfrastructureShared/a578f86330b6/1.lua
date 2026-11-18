-- Threat: !InfrastructureShared
-- Name: a578f86330b6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
