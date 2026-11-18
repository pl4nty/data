-- Threat: !InfrastructureShared
-- Name: 5c780cf7c2d1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
