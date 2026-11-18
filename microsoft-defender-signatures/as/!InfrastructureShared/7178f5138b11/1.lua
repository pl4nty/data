-- Threat: !InfrastructureShared
-- Name: 7178f5138b11
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
