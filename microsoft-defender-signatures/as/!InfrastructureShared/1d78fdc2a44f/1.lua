-- Threat: !InfrastructureShared
-- Name: 1d78fdc2a44f
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
