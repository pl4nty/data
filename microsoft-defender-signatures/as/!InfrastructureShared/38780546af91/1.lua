-- Threat: !InfrastructureShared
-- Name: 38780546af91
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
