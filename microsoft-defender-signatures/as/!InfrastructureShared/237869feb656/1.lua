-- Threat: !InfrastructureShared
-- Name: 237869feb656
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
