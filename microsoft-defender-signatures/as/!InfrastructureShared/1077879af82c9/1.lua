-- Threat: !InfrastructureShared
-- Name: 1077879af82c9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
