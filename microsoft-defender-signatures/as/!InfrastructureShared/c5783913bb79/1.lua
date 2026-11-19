-- Threat: !InfrastructureShared
-- Name: c5783913bb79
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
