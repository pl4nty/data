-- Threat: !InfrastructureShared
-- Name: 8e786cc5794e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
