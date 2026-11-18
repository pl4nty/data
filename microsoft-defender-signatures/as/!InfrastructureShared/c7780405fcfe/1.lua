-- Threat: !InfrastructureShared
-- Name: c7780405fcfe
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
