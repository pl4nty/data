-- Threat: !InfrastructureShared
-- Name: 637821b4be93
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
