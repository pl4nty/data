-- Threat: !InfrastructureShared
-- Name: 6378dccb6cba
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
