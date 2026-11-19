-- Threat: !InfrastructureShared
-- Name: 2a7785ca84b37
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
