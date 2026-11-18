-- Threat: !InfrastructureShared
-- Name: 3c780af71f74
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
