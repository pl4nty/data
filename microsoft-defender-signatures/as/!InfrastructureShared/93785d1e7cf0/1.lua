-- Threat: !InfrastructureShared
-- Name: 93785d1e7cf0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
