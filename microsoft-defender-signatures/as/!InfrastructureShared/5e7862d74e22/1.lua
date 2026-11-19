-- Threat: !InfrastructureShared
-- Name: 5e7862d74e22
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
