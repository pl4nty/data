-- Threat: !InfrastructureShared
-- Name: 507875be9ced
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
