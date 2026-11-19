-- Threat: !InfrastructureShared
-- Name: 5f78b4936ab6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
