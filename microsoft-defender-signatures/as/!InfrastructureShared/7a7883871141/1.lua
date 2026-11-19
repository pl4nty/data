-- Threat: !InfrastructureShared
-- Name: 7a7883871141
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
