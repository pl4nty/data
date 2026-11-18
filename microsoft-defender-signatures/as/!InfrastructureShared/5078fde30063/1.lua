-- Threat: !InfrastructureShared
-- Name: 5078fde30063
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
