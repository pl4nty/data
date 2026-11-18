-- Threat: !InfrastructureShared
-- Name: 4678f72b0d7c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
