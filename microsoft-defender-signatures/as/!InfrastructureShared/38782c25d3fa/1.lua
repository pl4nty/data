-- Threat: !InfrastructureShared
-- Name: 38782c25d3fa
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
