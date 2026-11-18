-- Threat: !InfrastructureShared
-- Name: 6d78db600bcb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
