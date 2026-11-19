-- Threat: !InfrastructureShared
-- Name: 20d785d83565e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
