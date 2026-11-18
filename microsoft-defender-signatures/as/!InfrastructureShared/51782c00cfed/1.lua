-- Threat: !InfrastructureShared
-- Name: 51782c00cfed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
