-- Threat: !InfrastructureShared
-- Name: 50782c1c6e5f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
