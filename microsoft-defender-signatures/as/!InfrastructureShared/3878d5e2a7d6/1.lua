-- Threat: !InfrastructureShared
-- Name: 3878d5e2a7d6
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
