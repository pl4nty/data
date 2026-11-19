-- Threat: !InfrastructureShared
-- Name: 2d7852270a61
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
