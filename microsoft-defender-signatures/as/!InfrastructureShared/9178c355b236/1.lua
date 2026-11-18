-- Threat: !InfrastructureShared
-- Name: 9178c355b236
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
