-- Threat: !InfrastructureShared
-- Name: 2a61f74aa34a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
