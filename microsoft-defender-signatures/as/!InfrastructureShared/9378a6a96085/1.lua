-- Threat: !InfrastructureShared
-- Name: 9378a6a96085
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
