-- Threat: !InfrastructureShared
-- Name: 6f783fae63be
-- Type: 21

if peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_loadconfig == true then
  return mp.INFECTED
end
return mp.CLEAN
