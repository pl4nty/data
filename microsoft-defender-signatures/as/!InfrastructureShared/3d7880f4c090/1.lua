-- Threat: !InfrastructureShared
-- Name: 3d7880f4c090
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
