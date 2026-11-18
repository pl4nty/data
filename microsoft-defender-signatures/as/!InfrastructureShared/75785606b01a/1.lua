-- Threat: !InfrastructureShared
-- Name: 75785606b01a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
