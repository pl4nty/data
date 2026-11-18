-- Threat: !InfrastructureShared
-- Name: 587889b2107c
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
