-- Threat: !InfrastructureShared
-- Name: 517875b2ee29
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
