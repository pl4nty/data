-- Threat: !InfrastructureShared
-- Name: 217863d172e4
-- Type: 21

if peattributes.lastscn_writable and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
