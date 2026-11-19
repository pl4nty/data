-- Threat: !InfrastructureShared
-- Name: 10d784bc703a4
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
