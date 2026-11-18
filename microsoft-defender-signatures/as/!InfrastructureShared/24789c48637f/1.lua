-- Threat: !InfrastructureShared
-- Name: 24789c48637f
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
