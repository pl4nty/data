-- Threat: !InfrastructureShared
-- Name: 507892d7e8aa
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
