-- Threat: !InfrastructureShared
-- Name: b578c91e475c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
