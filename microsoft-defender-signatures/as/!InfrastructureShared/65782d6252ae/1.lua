-- Threat: !InfrastructureShared
-- Name: 65782d6252ae
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
