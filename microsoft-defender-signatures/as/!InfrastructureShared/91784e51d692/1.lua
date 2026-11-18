-- Threat: !InfrastructureShared
-- Name: 91784e51d692
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
