-- Threat: !InfrastructureShared
-- Name: 9f789b93921a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
