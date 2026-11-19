-- Threat: !InfrastructureShared
-- Name: 1e07813eca43f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
