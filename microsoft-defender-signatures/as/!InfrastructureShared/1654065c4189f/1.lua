-- Threat: !InfrastructureShared
-- Name: 1654065c4189f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
