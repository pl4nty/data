-- Threat: !InfrastructureShared
-- Name: 3f784414a97d
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
