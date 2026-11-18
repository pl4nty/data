-- Threat: !InfrastructureShared
-- Name: 447873f2ab3c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
