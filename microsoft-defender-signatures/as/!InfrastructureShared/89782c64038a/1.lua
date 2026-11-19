-- Threat: !InfrastructureShared
-- Name: 89782c64038a
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
