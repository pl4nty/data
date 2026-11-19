-- Threat: !InfrastructureShared
-- Name: 977863dcb535
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
