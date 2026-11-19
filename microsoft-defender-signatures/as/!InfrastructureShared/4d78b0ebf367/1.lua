-- Threat: !InfrastructureShared
-- Name: 4d78b0ebf367
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
