-- Threat: !InfrastructureShared
-- Name: 10878b542db83
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
