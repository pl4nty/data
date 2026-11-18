-- Threat: !InfrastructureShared
-- Name: 687887f7a5f7
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
