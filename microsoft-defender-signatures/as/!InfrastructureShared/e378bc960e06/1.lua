-- Threat: !InfrastructureShared
-- Name: e378bc960e06
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
