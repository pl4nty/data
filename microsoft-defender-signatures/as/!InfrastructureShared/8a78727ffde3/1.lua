-- Threat: !InfrastructureShared
-- Name: 8a78727ffde3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
