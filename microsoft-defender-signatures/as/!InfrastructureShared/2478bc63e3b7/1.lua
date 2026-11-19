-- Threat: !InfrastructureShared
-- Name: 2478bc63e3b7
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
