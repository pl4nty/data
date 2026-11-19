-- Threat: !InfrastructureShared
-- Name: 10c7835138bfa
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
