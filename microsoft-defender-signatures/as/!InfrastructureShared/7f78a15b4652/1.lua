-- Threat: !InfrastructureShared
-- Name: 7f78a15b4652
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
