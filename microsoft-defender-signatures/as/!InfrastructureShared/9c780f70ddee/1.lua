-- Threat: !InfrastructureShared
-- Name: 9c780f70ddee
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
