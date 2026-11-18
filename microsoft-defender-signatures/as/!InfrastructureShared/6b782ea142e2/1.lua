-- Threat: !InfrastructureShared
-- Name: 6b782ea142e2
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
