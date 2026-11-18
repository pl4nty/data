-- Threat: !InfrastructureShared
-- Name: d17875039489
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
