-- Threat: !InfrastructureShared
-- Name: 91781704316d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
