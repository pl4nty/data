-- Threat: !InfrastructureShared
-- Name: 4f78c137decf
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
