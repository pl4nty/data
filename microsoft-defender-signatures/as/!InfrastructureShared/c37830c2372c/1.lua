-- Threat: !InfrastructureShared
-- Name: c37830c2372c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
