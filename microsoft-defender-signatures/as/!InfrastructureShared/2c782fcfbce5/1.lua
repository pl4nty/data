-- Threat: !InfrastructureShared
-- Name: 2c782fcfbce5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
