-- Threat: !InfrastructureShared
-- Name: 7a788ce1e571
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
