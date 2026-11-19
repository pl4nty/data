-- Threat: !InfrastructureShared
-- Name: 86782ac8f013
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
