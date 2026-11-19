-- Threat: !InfrastructureShared
-- Name: 4c7808455b2d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
