-- Threat: !InfrastructureShared
-- Name: 4d78e0b6b69a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
