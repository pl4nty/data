-- Threat: !InfrastructureShared
-- Name: 56789ea5ebc5
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
