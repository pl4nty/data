-- Threat: !InfrastructureShared
-- Name: 4a78c67958ba
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
