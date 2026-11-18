-- Threat: !InfrastructureShared
-- Name: 6f7849c95758
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
