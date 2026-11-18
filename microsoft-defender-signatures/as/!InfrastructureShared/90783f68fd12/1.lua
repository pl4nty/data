-- Threat: !InfrastructureShared
-- Name: 90783f68fd12
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
