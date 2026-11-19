-- Threat: !InfrastructureShared
-- Name: 5f78440c8331
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
