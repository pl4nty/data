-- Threat: !InfrastructureShared
-- Name: 9c78b3e643fd
-- Type: 21

if peattributes.hasexports == false and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
