-- Threat: !InfrastructureShared
-- Name: 3e789ed4a160
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
