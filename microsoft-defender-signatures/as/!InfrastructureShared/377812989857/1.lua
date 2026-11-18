-- Threat: !InfrastructureShared
-- Name: 377812989857
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
