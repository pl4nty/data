-- Threat: !InfrastructureShared
-- Name: 7e78ea99f62a
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.LOWFI
