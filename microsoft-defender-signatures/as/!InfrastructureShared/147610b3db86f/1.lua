-- Threat: !InfrastructureShared
-- Name: 147610b3db86f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
