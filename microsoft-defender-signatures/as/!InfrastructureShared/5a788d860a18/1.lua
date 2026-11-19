-- Threat: !InfrastructureShared
-- Name: 5a788d860a18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
