-- Threat: !InfrastructureShared
-- Name: 85409173f4fd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
