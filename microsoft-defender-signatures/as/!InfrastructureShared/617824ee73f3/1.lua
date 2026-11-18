-- Threat: !InfrastructureShared
-- Name: 617824ee73f3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
