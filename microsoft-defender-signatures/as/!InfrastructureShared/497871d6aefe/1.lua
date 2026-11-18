-- Threat: !InfrastructureShared
-- Name: 497871d6aefe
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
