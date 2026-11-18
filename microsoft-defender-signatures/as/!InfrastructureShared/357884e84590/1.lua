-- Threat: !InfrastructureShared
-- Name: 357884e84590
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
