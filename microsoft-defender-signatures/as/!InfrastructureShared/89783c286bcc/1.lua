-- Threat: !InfrastructureShared
-- Name: 89783c286bcc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
