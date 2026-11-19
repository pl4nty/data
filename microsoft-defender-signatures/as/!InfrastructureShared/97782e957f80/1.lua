-- Threat: !InfrastructureShared
-- Name: 97782e957f80
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
