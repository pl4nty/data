-- Threat: !InfrastructureShared
-- Name: 7461c50be7d4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
