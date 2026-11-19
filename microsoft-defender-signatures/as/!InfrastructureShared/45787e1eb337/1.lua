-- Threat: !InfrastructureShared
-- Name: 45787e1eb337
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
