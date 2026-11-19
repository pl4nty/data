-- Threat: !InfrastructureShared
-- Name: 597868f8b464
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
