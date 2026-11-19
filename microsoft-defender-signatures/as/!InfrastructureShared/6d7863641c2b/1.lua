-- Threat: !InfrastructureShared
-- Name: 6d7863641c2b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
