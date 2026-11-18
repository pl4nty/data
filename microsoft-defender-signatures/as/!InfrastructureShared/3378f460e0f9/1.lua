-- Threat: !InfrastructureShared
-- Name: 3378f460e0f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
