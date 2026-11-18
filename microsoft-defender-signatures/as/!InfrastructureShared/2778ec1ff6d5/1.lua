-- Threat: !InfrastructureShared
-- Name: 2778ec1ff6d5
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
