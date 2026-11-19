-- Threat: !InfrastructureShared
-- Name: 67785e5ec219
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
