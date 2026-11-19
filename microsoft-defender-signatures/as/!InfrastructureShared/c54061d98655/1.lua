-- Threat: !InfrastructureShared
-- Name: c54061d98655
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
