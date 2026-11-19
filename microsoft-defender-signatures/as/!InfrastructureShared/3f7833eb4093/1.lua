-- Threat: !InfrastructureShared
-- Name: 3f7833eb4093
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
