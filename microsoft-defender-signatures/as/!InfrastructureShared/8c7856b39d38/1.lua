-- Threat: !InfrastructureShared
-- Name: 8c7856b39d38
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
