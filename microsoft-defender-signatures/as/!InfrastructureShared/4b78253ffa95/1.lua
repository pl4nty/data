-- Threat: !InfrastructureShared
-- Name: 4b78253ffa95
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
