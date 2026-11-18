-- Threat: !InfrastructureShared
-- Name: bc78d1261920
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
