-- Threat: !InfrastructureShared
-- Name: 1f7883c39054
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
