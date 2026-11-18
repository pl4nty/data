-- Threat: !InfrastructureShared
-- Name: 53783999318c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
