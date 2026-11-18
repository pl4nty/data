-- Threat: !InfrastructureShared
-- Name: ae781d3fd4f2
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
