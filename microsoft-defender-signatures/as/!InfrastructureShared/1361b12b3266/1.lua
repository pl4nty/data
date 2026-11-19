-- Threat: !InfrastructureShared
-- Name: 1361b12b3266
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
