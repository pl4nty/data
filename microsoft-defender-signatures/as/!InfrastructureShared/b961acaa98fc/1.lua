-- Threat: !InfrastructureShared
-- Name: b961acaa98fc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
