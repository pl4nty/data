-- Threat: !InfrastructureShared
-- Name: 2f78b81b1f49
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
