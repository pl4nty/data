-- Threat: !InfrastructureShared
-- Name: 73780904f002
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
