-- Threat: !InfrastructureShared
-- Name: 3778ff4ea17d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
