-- Threat: !InfrastructureShared
-- Name: 4c78d5eb8b7f
-- Type: 21

if peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_loadconfig == true then
  return mp.INFECTED
end
return mp.CLEAN
