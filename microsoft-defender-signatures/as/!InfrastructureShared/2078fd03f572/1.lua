-- Threat: !InfrastructureShared
-- Name: 2078fd03f572
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
