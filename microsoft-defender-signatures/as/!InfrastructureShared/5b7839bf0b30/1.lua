-- Threat: !InfrastructureShared
-- Name: 5b7839bf0b30
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
