-- Threat: !InfrastructureShared
-- Name: 377850e9d665
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
