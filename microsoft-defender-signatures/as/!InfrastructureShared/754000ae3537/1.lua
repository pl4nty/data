-- Threat: !InfrastructureShared
-- Name: 754000ae3537
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
