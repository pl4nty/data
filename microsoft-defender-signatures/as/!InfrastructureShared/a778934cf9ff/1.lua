-- Threat: !InfrastructureShared
-- Name: a778934cf9ff
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
