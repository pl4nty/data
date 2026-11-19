-- Threat: !InfrastructureShared
-- Name: 6e7897d1ede7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
