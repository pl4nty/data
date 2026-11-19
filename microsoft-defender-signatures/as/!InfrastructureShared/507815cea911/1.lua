-- Threat: !InfrastructureShared
-- Name: 507815cea911
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
