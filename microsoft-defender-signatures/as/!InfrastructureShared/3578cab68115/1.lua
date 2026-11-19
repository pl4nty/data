-- Threat: !InfrastructureShared
-- Name: 3578cab68115
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
