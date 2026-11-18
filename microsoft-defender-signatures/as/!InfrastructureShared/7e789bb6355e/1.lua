-- Threat: !InfrastructureShared
-- Name: 7e789bb6355e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
