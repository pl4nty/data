-- Threat: !InfrastructureShared
-- Name: 5e78bc23de23
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
