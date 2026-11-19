-- Threat: !InfrastructureShared
-- Name: 5b78fe5ed8b8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
