-- Threat: !InfrastructureShared
-- Name: 8778207dcdb6
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
