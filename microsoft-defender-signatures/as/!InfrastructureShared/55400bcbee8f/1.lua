-- Threat: !InfrastructureShared
-- Name: 55400bcbee8f
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
