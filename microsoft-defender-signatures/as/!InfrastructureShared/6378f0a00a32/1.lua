-- Threat: !InfrastructureShared
-- Name: 6378f0a00a32
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
