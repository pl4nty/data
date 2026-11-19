-- Threat: !InfrastructureShared
-- Name: 9f7802e02e98
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
