-- Threat: !InfrastructureShared
-- Name: 837826e06f6c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
