-- Threat: !InfrastructureShared
-- Name: 3778f6dfce97
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
