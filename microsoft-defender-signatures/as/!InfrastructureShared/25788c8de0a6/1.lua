-- Threat: !InfrastructureShared
-- Name: 25788c8de0a6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
