-- Threat: !InfrastructureShared
-- Name: 77783e3f066f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
