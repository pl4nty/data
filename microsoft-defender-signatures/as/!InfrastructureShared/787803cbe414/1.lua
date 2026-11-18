-- Threat: !InfrastructureShared
-- Name: 787803cbe414
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
