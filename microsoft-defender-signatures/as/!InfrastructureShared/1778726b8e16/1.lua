-- Threat: !InfrastructureShared
-- Name: 1778726b8e16
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
