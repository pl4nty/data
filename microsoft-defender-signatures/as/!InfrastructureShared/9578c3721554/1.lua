-- Threat: !InfrastructureShared
-- Name: 9578c3721554
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
