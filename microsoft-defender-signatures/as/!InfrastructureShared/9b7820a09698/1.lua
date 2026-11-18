-- Threat: !InfrastructureShared
-- Name: 9b7820a09698
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
