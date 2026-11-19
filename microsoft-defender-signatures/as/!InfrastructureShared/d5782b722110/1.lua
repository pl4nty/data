-- Threat: !InfrastructureShared
-- Name: d5782b722110
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
