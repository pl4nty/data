-- Threat: !InfrastructureShared
-- Name: 5c784e361b79
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
