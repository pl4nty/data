-- Threat: !InfrastructureShared
-- Name: 5f7882b8c93b
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
