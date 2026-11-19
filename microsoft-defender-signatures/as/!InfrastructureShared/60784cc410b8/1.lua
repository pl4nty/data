-- Threat: !InfrastructureShared
-- Name: 60784cc410b8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
