-- Threat: !InfrastructureShared
-- Name: 4d784a864367
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
