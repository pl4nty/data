-- Threat: !InfrastructureShared
-- Name: 85780034e229
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
