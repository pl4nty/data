-- Threat: !InfrastructureShared
-- Name: e540a66b3509
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
