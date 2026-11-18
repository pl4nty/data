-- Threat: !InfrastructureShared
-- Name: 507800b9561d
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
