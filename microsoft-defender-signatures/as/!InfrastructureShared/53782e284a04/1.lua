-- Threat: !InfrastructureShared
-- Name: 53782e284a04
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
