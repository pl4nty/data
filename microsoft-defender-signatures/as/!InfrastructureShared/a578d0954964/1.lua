-- Threat: !InfrastructureShared
-- Name: a578d0954964
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
