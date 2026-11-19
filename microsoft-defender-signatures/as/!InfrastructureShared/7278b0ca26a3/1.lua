-- Threat: !InfrastructureShared
-- Name: 7278b0ca26a3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
