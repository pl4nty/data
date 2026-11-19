-- Threat: !InfrastructureShared
-- Name: 5e78565518b1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
