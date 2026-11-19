-- Threat: !InfrastructureShared
-- Name: 8541af300c67
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
