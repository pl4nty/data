-- Threat: !InfrastructureShared
-- Name: 354001797501
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
