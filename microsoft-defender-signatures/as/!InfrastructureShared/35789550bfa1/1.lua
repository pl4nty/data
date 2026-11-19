-- Threat: !InfrastructureShared
-- Name: 35789550bfa1
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
