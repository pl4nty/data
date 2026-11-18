-- Threat: !InfrastructureShared
-- Name: 997850f6d150
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
