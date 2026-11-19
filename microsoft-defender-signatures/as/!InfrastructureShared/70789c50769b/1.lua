-- Threat: !InfrastructureShared
-- Name: 70789c50769b
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
