-- Threat: !InfrastructureShared
-- Name: 5a788dc34e9d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
