-- Threat: !InfrastructureShared
-- Name: 18540e0cdf7ee
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
