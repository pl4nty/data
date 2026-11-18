-- Threat: !InfrastructureShared
-- Name: 3778be922cd4
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
