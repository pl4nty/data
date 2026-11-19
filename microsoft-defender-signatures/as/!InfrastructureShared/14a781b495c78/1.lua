-- Threat: !InfrastructureShared
-- Name: 14a781b495c78
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
