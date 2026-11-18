-- Threat: !InfrastructureShared
-- Name: 5b78f60fc33c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
