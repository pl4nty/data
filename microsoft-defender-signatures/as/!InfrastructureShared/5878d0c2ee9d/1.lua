-- Threat: !InfrastructureShared
-- Name: 5878d0c2ee9d
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
