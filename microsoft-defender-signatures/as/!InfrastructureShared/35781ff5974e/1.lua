-- Threat: !InfrastructureShared
-- Name: 35781ff5974e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
