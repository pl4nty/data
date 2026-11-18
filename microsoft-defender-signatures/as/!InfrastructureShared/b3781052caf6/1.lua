-- Threat: !InfrastructureShared
-- Name: b3781052caf6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
