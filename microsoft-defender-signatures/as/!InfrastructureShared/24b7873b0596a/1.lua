-- Threat: !InfrastructureShared
-- Name: 24b7873b0596a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
