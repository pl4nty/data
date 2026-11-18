-- Threat: !InfrastructureShared
-- Name: 486168575950
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
