-- Threat: !InfrastructureShared
-- Name: 2e7825e59d95
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
