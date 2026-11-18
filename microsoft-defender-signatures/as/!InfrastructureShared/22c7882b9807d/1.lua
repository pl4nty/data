-- Threat: !InfrastructureShared
-- Name: 22c7882b9807d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
