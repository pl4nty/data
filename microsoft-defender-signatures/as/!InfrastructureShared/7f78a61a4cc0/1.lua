-- Threat: !InfrastructureShared
-- Name: 7f78a61a4cc0
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
