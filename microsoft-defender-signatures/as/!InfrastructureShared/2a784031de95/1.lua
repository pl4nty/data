-- Threat: !InfrastructureShared
-- Name: 2a784031de95
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
