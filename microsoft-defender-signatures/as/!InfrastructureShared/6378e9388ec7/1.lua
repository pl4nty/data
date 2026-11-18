-- Threat: !InfrastructureShared
-- Name: 6378e9388ec7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
