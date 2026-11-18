-- Threat: !InfrastructureShared
-- Name: c6787638fc3f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
