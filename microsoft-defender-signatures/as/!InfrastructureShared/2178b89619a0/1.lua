-- Threat: !InfrastructureShared
-- Name: 2178b89619a0
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
