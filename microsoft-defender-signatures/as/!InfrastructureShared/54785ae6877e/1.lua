-- Threat: !InfrastructureShared
-- Name: 54785ae6877e
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
