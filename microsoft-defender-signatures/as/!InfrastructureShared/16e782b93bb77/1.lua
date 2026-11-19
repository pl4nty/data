-- Threat: !InfrastructureShared
-- Name: 16e782b93bb77
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
