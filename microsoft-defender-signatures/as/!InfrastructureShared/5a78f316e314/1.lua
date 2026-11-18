-- Threat: !InfrastructureShared
-- Name: 5a78f316e314
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
