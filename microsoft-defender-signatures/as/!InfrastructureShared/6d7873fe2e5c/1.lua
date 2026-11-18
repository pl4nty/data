-- Threat: !InfrastructureShared
-- Name: 6d7873fe2e5c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
