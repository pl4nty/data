-- Threat: !InfrastructureShared
-- Name: 9078cfcd382d
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
