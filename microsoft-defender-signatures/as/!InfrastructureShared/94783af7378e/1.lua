-- Threat: !InfrastructureShared
-- Name: 94783af7378e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
