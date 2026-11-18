-- Threat: !InfrastructureShared
-- Name: 8c78853361e0
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
