-- Threat: !InfrastructureShared
-- Name: 4278934f9700
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
