-- Threat: !InfrastructureShared
-- Name: 5678e5fb0164
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
