-- Threat: !InfrastructureShared
-- Name: c278b2133ec6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
