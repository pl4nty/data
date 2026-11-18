-- Threat: !InfrastructureShared
-- Name: f778862893fd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
