-- Threat: !InfrastructureShared
-- Name: 302785ab71deb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
