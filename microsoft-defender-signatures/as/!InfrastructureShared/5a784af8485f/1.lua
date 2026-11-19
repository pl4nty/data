-- Threat: !InfrastructureShared
-- Name: 5a784af8485f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
