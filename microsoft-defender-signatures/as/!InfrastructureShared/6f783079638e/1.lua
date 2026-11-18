-- Threat: !InfrastructureShared
-- Name: 6f783079638e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
