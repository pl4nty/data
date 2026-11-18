-- Threat: !InfrastructureShared
-- Name: 75406f8fa269
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
