-- Threat: !InfrastructureShared
-- Name: 1db78a6e26e31
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
