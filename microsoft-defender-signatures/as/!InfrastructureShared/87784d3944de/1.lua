-- Threat: !InfrastructureShared
-- Name: 87784d3944de
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
