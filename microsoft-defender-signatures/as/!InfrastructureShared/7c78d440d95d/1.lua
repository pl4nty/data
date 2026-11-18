-- Threat: !InfrastructureShared
-- Name: 7c78d440d95d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
