-- Threat: !InfrastructureShared
-- Name: 3b786ecdb062
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
