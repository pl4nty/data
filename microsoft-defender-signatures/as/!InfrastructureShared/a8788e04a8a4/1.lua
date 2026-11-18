-- Threat: !InfrastructureShared
-- Name: a8788e04a8a4
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
