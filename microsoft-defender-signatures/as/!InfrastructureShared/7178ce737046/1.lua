-- Threat: !InfrastructureShared
-- Name: 7178ce737046
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
