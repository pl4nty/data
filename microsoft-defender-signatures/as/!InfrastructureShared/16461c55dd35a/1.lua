-- Threat: !InfrastructureShared
-- Name: 16461c55dd35a
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
