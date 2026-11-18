-- Threat: !InfrastructureShared
-- Name: 2e61f4959922
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
