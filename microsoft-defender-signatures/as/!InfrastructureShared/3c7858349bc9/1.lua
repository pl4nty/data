-- Threat: !InfrastructureShared
-- Name: 3c7858349bc9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
