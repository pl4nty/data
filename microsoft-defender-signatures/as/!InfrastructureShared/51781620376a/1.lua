-- Threat: !InfrastructureShared
-- Name: 51781620376a
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
