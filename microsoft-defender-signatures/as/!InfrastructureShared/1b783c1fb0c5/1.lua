-- Threat: !InfrastructureShared
-- Name: 1b783c1fb0c5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
