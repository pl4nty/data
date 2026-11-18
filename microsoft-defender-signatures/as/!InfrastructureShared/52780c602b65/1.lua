-- Threat: !InfrastructureShared
-- Name: 52780c602b65
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
