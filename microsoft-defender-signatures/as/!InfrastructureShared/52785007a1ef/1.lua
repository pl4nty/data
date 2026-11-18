-- Threat: !InfrastructureShared
-- Name: 52785007a1ef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
