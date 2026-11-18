-- Threat: !InfrastructureShared
-- Name: 387800531b0f
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
