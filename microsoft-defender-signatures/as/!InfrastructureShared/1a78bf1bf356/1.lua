-- Threat: !InfrastructureShared
-- Name: 1a78bf1bf356
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
