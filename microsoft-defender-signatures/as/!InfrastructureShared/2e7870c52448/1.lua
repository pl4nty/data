-- Threat: !InfrastructureShared
-- Name: 2e7870c52448
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
