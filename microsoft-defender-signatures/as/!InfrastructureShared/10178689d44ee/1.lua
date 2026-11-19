-- Threat: !InfrastructureShared
-- Name: 10178689d44ee
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
