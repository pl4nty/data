-- Threat: !InfrastructureShared
-- Name: 4678d539cd47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
